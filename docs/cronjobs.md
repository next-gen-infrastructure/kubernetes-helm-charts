# cronjobs

Several CronJobs from one `cronjobs` map; chart-level settings (image, security, scheduling, env, resources, volumes) are defaults shared by all jobs.

## Resources

One CronJob per key in `cronjobs`, plus optional ServiceAccount, ConfigMap (`configMap.enabled`) and ExternalSecret (`env.vaultSecret`).

## Per-job fields

```yaml
cronjobs:
  nightly-report:
    schedule: "0 2 * * *"
    command: ["php"]
    args: ["bin/console", "report:send"]
    concurrencyPolicy: Forbid
    suspend: false
    startingDeadlineSeconds: 20
    successfulJobsHistoryLimit: 2
    failedJobsHistoryLimit: 10
    backoffLimit: 6
    resources: { requests: { cpu: 100m, memory: 256Mi } }
    env:
      values: { FOO: bar }
      vaultSecret:
        API_KEY: { path: mySecret, secret: password }
```

Image comes from `global.image` (`registry`, `repository`, `tag`, `pullPolicy`, `pullSecrets`).

Examples: `charts/cronjobs/examples/full`. Values reference: [charts/cronjobs/README.md](../charts/cronjobs/README.md).
