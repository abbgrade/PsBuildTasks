# Keep build tasks in consuming projects

## Context and Problem Statement

PsBuildTasks provides build automation to multiple PowerShell and .NET module projects. Those
projects need to run and version their build workflows alongside their own source code, while
still benefiting from improvements to the shared task definitions.

## Considered Options

* Install task scripts into each project and update them from shared templates
* Maintain independent build scripts in each project

## Decision Outcome

Chosen option: "Install task scripts into each project and update them from shared templates",
because task files can be committed and used as part of each project's build while the module
provides a way to install and refresh those files.

### Consequences

* Good, because each project can version its build task files with its source.
* Good, because shared improvements can be pulled into projects through the update tasks.
* Bad, because projects can drift if they do not periodically update their copies.
