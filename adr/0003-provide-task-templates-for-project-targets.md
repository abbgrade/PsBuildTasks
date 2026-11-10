# Provide task templates for project targets

## Context and Problem Statement

Consuming projects differ by implementation language and supported platforms. Their build,
validation, and release workflows therefore need different task configurations, but should
still share the common PsBuildTasks update experience.

## Considered Options

* Provide one task template for every project type and platform
* Provide separate task templates for supported project and platform targets

## Decision Outcome

Chosen option: "Provide separate task templates for supported project and platform targets",
because PowerShell and .NET modules, as well as Windows-only and cross-platform PowerShell
projects, require different task behavior.

### Consequences

* Good, because each template can provide workflows appropriate to its project's language and
  supported platforms.
* Bad, because template behavior must be kept consistent where workflows are shared.
* Bad, because projects must select the template that matches their target.
