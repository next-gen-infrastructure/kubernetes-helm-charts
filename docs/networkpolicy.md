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
| `allowedNamespaces` | `[]` | any extra namespaces (e.g. `monitoring` for Prometheus) |

**Egress** stays fully open until `egress.fqdns` or `extraEgress` is set. Then everything not listed is denied, and kube-dns is allowed first when `egress.allowDNS` is `true` (the default). `cronjobs` has egress only; its ingress is fully denied.

## Extra rules

`extraIngress` / `extraEgress` are raw rules appended as is (templatable). Write them in the native format of the selected kind:

```yaml
deployment:
  networkPolicy:
    enabled: true
    allowedNamespaces: [monitoring]
    egress:
      fqdns: ["api.stripe.com", "*.amazonaws.com"]   # cilium only
    extraEgress:
      - toCIDR: ["10.0.0.0/8"]                        # cilium syntax
```

```yaml
deployment:
  networkPolicy:
    enabled: true
    cilium: false
    extraEgress:
      - to: [{ ipBlock: { cidr: 10.0.0.0/8 } }]       # NetworkPolicy syntax
        ports: [{ port: 5432 }]
```

Examples: `charts/*/examples/networkpolicy*`. Values reference: each chart's generated `README.md`.
