# vaultsecrets

Generates ExternalSecrets that pull values from Vault (via a `ClusterSecretStore`).

```yaml
global:
  environment: dev
  secretStore: vault
kubeSecrets:
  example:                 # ExternalSecret and target Secret: example-vault
    - name: foo            # key in the resulting Secret
      path: mySecret       # Vault key: <environment>/mySecret
      secret: password     # property inside it (defaults to name)
```

Requires [External Secrets Operator](https://external-secrets.io) and the named `ClusterSecretStore` in the cluster. Uses `external-secrets.io/v1beta1`.

Values reference: [charts/vaultsecrets/README.md](../charts/vaultsecrets/README.md).
