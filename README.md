# Flare Actions demo

Three small pull requests show how [Flare PR Security Check](https://github.com/tryflare-ai/pr-security-check) reviews infrastructure changes: a risky permission expansion, its repair, and a harmless comment edit.

These are **synthetic fixtures**. No infrastructure is deployed. The remediation fixture intentionally starts with a broad role so its PR can demonstrate removing it.

## Inspect the examples

Open the [demo pull requests](https://github.com/tryflare-ai/actions-demo/pulls), inspect the diff, then read the Flare comment and workflow logs. Live results require the repository's dedicated Flare API key to be configured. Until a run finishes successfully, expected behavior is a description, not a measured result.

| Example | Change | Expected behavior |
| --- | --- | --- |
| Risky change | Viewer role becomes Editor | Explain the permission expansion and suggest a narrower role |
| Repair | Editor role becomes Viewer | Do not report the removed broad grant as a new risk |
| Harmless edit | Change a comment, retain Viewer | No configuration-risk finding |

The workflow uses `fail-on: none` so reviewers can inspect results without blocking the demo. A green job alone does not prove no findings: missing credentials, quota warnings and skipped reviews must be checked in logs. The workflow only runs for same-repository PRs; forks do not receive the demo secret.

## Try it in your repository

1. [Create a Flare account](https://tryflare.ai/sign-up) and create an API key under Settings.
2. Add it as a GitHub Actions secret named `FLARE_API_KEY`.
3. Follow the [PR Action quick start](https://github.com/tryflare-ai/pr-security-check#quick-start). Use the `pull_request` trigger and pin the Action to a reviewed release or full commit SHA.

The Action sends selected diffs, filenames and PR metadata to Flare. Recognizable secrets are redacted from diffs before Anthropic analysis; redaction is not a guarantee that every secret is removed. Results are saved by Flare and can be posted publicly in the PR. Submit only material suitable for that data flow.

## The four Actions

- [PR security check](https://github.com/tryflare-ai/pr-security-check): infrastructure review before merge; no cloud connector required.
- [Deploy webhook](https://github.com/tryflare-ai/deploy-webhook): queue post-deploy cloud audit review.
- [Incident scope](https://github.com/tryflare-ai/incident-scope): time-bounded cloud investigation in a GitHub Issue.
- [Security changelog](https://github.com/tryflare-ai/security-changelog): GCP audit summaries in Markdown, JSON and optional Issues.

Only the PR Action is exercised here. The other Actions require cloud connections and their own setup. AI findings can be incomplete or incorrect; review them against your environment.

[Explore Flare for GitHub Actions](https://tryflare.ai/github-actions) · [Privacy](https://tryflare.ai/privacy)

## License

MIT. See [LICENSE](LICENSE).
