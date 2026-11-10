# Use Invoke-Build to orchestrate project tasks

## Context and Problem Statement

The project needs repeatable build, test, packaging, and release workflows that can be composed
from reusable tasks. Contributors and consuming projects need a consistent way to run those
workflows.

## Considered Options

* Use Invoke-Build tasks. Eat your own dog food.

## Decision Outcome

Chosen option: "Use Invoke-Build tasks", because the repository already defines its build and
project-update workflows as tasks and can compose dependencies between them.

### Consequences

* Good, because related operations can be composed into reusable, named workflows.
* Good, because consuming projects can use the same task-oriented interface.
* Bad, because contributors need Invoke-Build installed to run these workflows.
