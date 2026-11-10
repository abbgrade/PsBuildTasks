# Architecture Decision Records

This directory contains the project's architecture decision records (ADRs), using the
[MADR minimal template](https://github.com/adr/madr/blob/develop/template/adr-template-minimal.md).
The decisions document architecture visible in the existing implementation. Their rationale
is reconstructed from the code and current project requirements; it may not reflect the
original decision discussions.

## Creating an ADR

1. Copy [adr-template.md](./adr-template.md).
2. Name the new file with the next four-digit number and a short, descriptive title, for
   example `0004-support-additional-module-targets.md`.
3. Keep the record focused on one decision. Add the relevant alternatives and trade-offs.
4. If a decision changes, add a new ADR that explains the change and links to the superseded
   record rather than silently rewriting history.
5. Submit ADRs with the change they concern for review.

## Decisions

* [0001: Keep build tasks in consuming projects](./0001-keep-build-tasks-in-consuming-projects.md)
* [0002: Use Invoke-Build to orchestrate project tasks](./0002-use-invoke-build-to-orchestrate-project-tasks.md)
* [0003: Provide task templates for project targets](./0003-provide-task-templates-for-project-targets.md)
