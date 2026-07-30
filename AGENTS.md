# PsBuildTasks AI Agent Guidance

This repository is a PowerShell build-task project for module automation. The following notes help an AI coding agent understand the repository shape, the main workflows, and where to make changes.

## What this repository is

- A reusable PowerShell build automation repository for PowerShell modules and DotNet/C# modules.
- Provides `InvokeBuild` task templates in `tasks/` and workflow templates in `GitHub/`.
- Includes a PowerShell module in `src/` and a published package layout in `publish/`.

## Key directories

- `src/` - primary module source files, including `PsBuildTasks.psd1` and `PsBuildTasks.psm1`.
- `tasks/` - InvokeBuild task definitions and update scripts for build/task/workflow templates.
- `GitHub/` - GitHub Actions workflow templates and README guidance for CI usage.
- `docs/` - documentation content and generated help files.
- `publish/` - packaged output for the module and install helpers.
- `test/` - Pester test suites.
- `.vscode/` - VS Code task and launch configuration.

## Primary workflows

- Build the repository with: `Invoke-Build Build`
- Clean with: `Invoke-Build Clean`
- Install with: `Invoke-Build Install`
- Update docs with: `Invoke-Build UpdateDocs`
- Run unit tests with: `Invoke-Pester` from the `test` directory.

## Important conventions

- This repository uses `Invoke-Build` task files rather than a typical `dotnet` or `npm` build system.
- `tasks/Build.Tasks.ps1` is the canonical build task template for this repo.
- Workflow templates in `GitHub/` are designed to be downloaded into a consumer repository by the `tasks/*-Matrix.Tasks.ps1` scripts.
- `Install-PsBuildTask` and `Install-PsBuildExtension` are the public module commands exposed by the PowerShell module.

## Notes for code changes

- Prefer editing source in `src/` and task templates in `tasks/`.
- Do not treat `publish/` as source; it contains packaged/published artifacts.
- Documentation is maintained in `docs/` and README files.
- Update `tasks/Readme.md`, `GitHub/Readme.md`, and `VsCode/Readme.md` when build/task/workflow behavior changes.

## Useful files to consult

- `Readme.md` - repository overview and getting started guidance.
- `tasks/Readme.md` - task template usage and update patterns.
- `GitHub/Readme.md` - CI workflow expectations and GitHub Actions patterns.
- `VsCode/Readme.md` - VS Code task setup.
- `tasks/Build.Tasks.ps1` - core build task definitions.
- `.vscode/tasks.json` - recommended local VS Code tasks.
- `test/*.ps1` - Pester test coverage.

## Best behavior for AI agents

- Link to repository docs instead of duplicating them.
- When asked to fix or extend build automation, check both `tasks/` and `GitHub/`.
- When asked to fix test or publish issues, use the existing PowerShell patterns and build tasks rather than inventing a new CI style.
- Keep changes minimal and consistent with PowerShell module and `InvokeBuild` conventions.
