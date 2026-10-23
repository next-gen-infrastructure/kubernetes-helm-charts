# Network policies

`deployment`, `statefulset`, `daemonset` and `cronjobs` can render a network policy for their pods. Off by default (`networkPolicy.enabled: false`).
Implementation: `charts/common/templates/_networkpolicy.tpl`.

## Kind: `networkPolicy.cilium`

| `cilium` | Renders |
|---|---|
| `true` (default) | `CiliumNetworkPolicy` (`cilium.io/v2`), needs the Cilium CRDs in the cluster |
| `false` | standard `NetworkPolicy` (`networking.k8s.io/v1`), any CNI that enforces it |

Only Cilium can allow egress by hostname (`egress.fqdns`); setting it with `cilium: false` fails the render.

## What is allowed

**Ingress** is default-deny. Traffic is allowed from these namespaces, to the ports in `service.ports` (including sidecar `service.ports`; none listed means all ports):

| Value | Default | Namespace |
|---|---|---|
| `allowIngressFromIngressController` + `ingressControllerNamespace` | `true`, `kube-system` | the ingress controller |
| `allowSameNamespace` | `true` | the release namespace |
| `allowedNamespaces` | `[]` | any extra namespaces |
| `metrics.prometheusNamespace` (when `metrics.enabled`) | `monitoring` | Prometheus; reaches only the `metrics.port` service port |

**Egress** stays fully open until `egress.fqdns` or `extraEgress` is set. Then everything not listed is denied, and kube-dns is allowed first when `egress.allowDNS` is `true` (the default). `cronjobs` has egress only; its ingress is fully denied.

## Extra rules

`extraIngress` / `extraEgress` are raw rules appended as is (templatable, e.g. `{{ .Release.Namespace }}`). Write them in the native format of the selected kind. Setting `extraEgress` (or `egress.fqdns`) switches egress to default-deny, so list everything the pods need to reach, in-cluster dependencies included.

### Cilium (`cilium: true`)

Typical service: public ingress, Prometheus, a database in the same namespace, a shared cache in another namespace, a third-party API by hostname and the Kubernetes API.

```yaml
deployment:
  service:
    ports:
      http: 8080
  metrics:
    enabled: true
    port: http
    prometheusNamespace: monitoring      # may scrape the metrics port only
  networkPolicy:
    enabled: true
    ingressControllerNamespace: traefik
    allowedNamespaces: [frontend]        # these namespaces reach the service ports
    egress:
      fqdns: ["api.stripe.com", "*.amazonaws.com"]   # DNS is allowed automatically
    extraIngress:
      # another app, only on one port
      - fromEndpoints:
          - matchLabels:
              k8s:io.kubernetes.pod.namespace: batch
              app.kubernetes.io/name: report-runner
        toPorts:
          - ports: [{ port: "8080", protocol: TCP }]
    extraEgress:
      # database pods in the release namespace
      - toEndpoints:
          - matchLabels:
              k8s:io.kubernetes.pod.namespace: "{{ .Release.Namespace }}"
              app.kubernetes.io/name: postgres
        toPorts:
          - ports: [{ port: "5432", protocol: TCP }]
      # cache in another namespace
      - toEndpoints:
          - matchLabels:
              k8s:io.kubernetes.pod.namespace: shared
              app.kubernetes.io/name: redis
        toPorts:
          - ports: [{ port: "6379", protocol: TCP }]
      # an IP range, not a hostname
      - toCIDR: ["10.20.0.0/16"]
        toPorts:
          - ports: [{ port: "443", protocol: TCP }]
      # the Kubernetes API server
      - toEntities: [kube-apiserver]
```

- `egress.fqdns` takes exact names (`matchName`) and wildcards (`matchPattern`, when the entry contains `*`) on any port. Restrict ports with your own `toFQDNs` rule in `extraEgress` if needed:

  ```yaml
  extraEgress:
    - toFQDNs: [{ matchName: api.stripe.com }]
      toPorts:
        - ports: [{ port: "443", protocol: TCP }]
  ```

  In that case leave the hostname out of `egress.fqdns`, otherwise the open rule makes the restricted one pointless.
- FQDN rules only work together with the DNS rule that `egress.allowDNS: true` adds (it makes Cilium observe DNS answers). If you set `allowDNS: false`, add an equivalent DNS rule yourself.
- Cilium ports are strings (`"8080"`), and `ANY` is a valid protocol.
- Other entities for `toEntities` / `fromEntities`: `world` (anything outside the cluster), `cluster`, `host`.

### Kubernetes `NetworkPolicy` (`cilium: false`)

The same service without FQDNs, which this kind cannot express. Allow external APIs by CIDR instead.

```yaml
deployment:
  service:
    ports:
      http: 8080
  metrics:
    enabled: true
    port: http
    prometheusNamespace: monitoring
  networkPolicy:
    enabled: true
    cilium: false
    allowedNamespaces: [frontend]
    extraIngress:
      # another app, only on one port
      - from:
          - namespaceSelector:
              matchLabels:
                kubernetes.io/metadata.name: batch
            podSelector:
              matchLabels:
                app.kubernetes.io/name: report-runner
        ports: [{ port: 8080, protocol: TCP }]
      # a fixed office range
      - from:
          - ipBlock: { cidr: 203.0.113.0/24 }
    extraEgress:
      # database pods in the release namespace (podSelector alone = same namespace)
      - to:
          - podSelector:
              matchLabels:
                app.kubernetes.io/name: postgres
        ports: [{ port: 5432 }]
      # cache in another namespace
      - to:
          - namespaceSelector:
              matchLabels:
                kubernetes.io/metadata.name: shared
            podSelector:
              matchLabels:
                app.kubernetes.io/name: redis
        ports: [{ port: 6379 }]
      # everything public except private ranges
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except: [10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16]
        ports: [{ port: 443 }]
```

Notes:

- A `namespaceSelector` and `podSelector` in the same `from` / `to` entry are ANDed; as two separate entries they are ORed. The examples above use the AND form.
- There is no kube-apiserver selector; allow its IP with an `ipBlock` (`kubectl get endpoints kubernetes`).
- `cronjobs` takes `egress.*` and `extraEgress` only, with the same syntax. Its ingress is already denied.

Runnable versions live in `charts/*/examples/networkpolicy*`. Values reference: each chart's generated `README.md`.
