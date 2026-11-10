---
name: bump-version
description: "Use when bumping or releasing a new PsBuildTasks version, such as updating the module version, promoting changelog entries, or updating the pinned reusable workflow versions in the GitHub templates."
argument-hint: "Optional new version, for example 1.18.0; defaults to the version in the branch name"
---

# Bump the PsBuildTasks Version

## When to Use

- The user asks to bump the version, prepare a release, or set a specific version such as `1.18.0`. The version is optional when the current branch name contains it.

## Procedure

1. Determine the new version. Use the version the user gave. Otherwise derive it from the current branch name (`git branch --show-current`): git-flow `release/<version>` and `hotfix/<version>` branches carry the version, for example `release/1.18.0` gives `1.18.0`. Ask the user only if the branch name does not contain a version. Read the current version from `ModuleVersion` in [PsBuildTasks.psd1](../../../src/PsBuildTasks.psd1).
2. Update `ModuleVersion` in [PsBuildTasks.psd1](../../../src/PsBuildTasks.psd1).
3. Update [CHANGELOG.md](../../../CHANGELOG.md) following the changelog instructions:
   - Keep an empty `## [Unreleased]` section at the top.
   - Add `## [<new version>] - <today's date, yyyy-MM-dd>` directly below it and move the unreleased entries into it.
   - Do not change older release entries.
4. Update the pinned reusable workflow version in every template in [GitHub/](../../../GitHub): replace `@<old version>` with `@<new version>` on the `uses: abbgrade/PsBuildTasks/.github/workflows/...` lines.
5. Do not change the workflows in this repository's `.github/workflows/` directory; they stay on the last published version.

## Validation

- Run `Test-ModuleManifest -Path src/PsBuildTasks.psd1` and confirm the reported version.
- Search `GitHub/` for the old version and confirm that no `@<old version>` pins remain.
- Run `git diff --check` and review the diff to confirm that only the intended files changed.

Do not commit, tag, or publish unless the user explicitly asks.
