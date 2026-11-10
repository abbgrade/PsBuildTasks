---
name: bump-version
description: "Use when bumping or releasing a project's version, including deriving the target from Git-flow release or hotfix branch names. Update version metadata, release notes, and references consistently."
argument-hint: "Optional target version, for example 1.18.0"
---

# Bump a Project Version

## When to Use

- The user asks to bump a project's version, prepare a release, or set a specific version.

## Procedure

1. Inspect the worktree and project documentation. Identify the authoritative current version, the project's versioning scheme, and all files or generated metadata that must stay in sync. Preserve unrelated staged and unstaged changes.
2. Use the exact target version requested by the user. If none was provided, inspect the current branch (`git branch --show-current`) and derive the version from Git-flow branch names: `release/<version>` or `hotfix/<version>` (for example, `release/1.18.0` means `1.18.0`). If the branch does not specify a version, use the project's release conventions and infer a SemVer increment only when the change scope clearly supports it; otherwise ask. Never guess a release date.
3. Update the authoritative version declaration and any dependent version values required by the project. Avoid changing unrelated dependency versions, tool/schema versions, or published workflow pins.
4. If the project has a changelog, update it to reflect the target version. Follow its existing format and applicable repository instructions; for versioned release headings, use the target version and promote unreleased notes under that release. Preserve the unreleased section when the project convention requires it, do not invent entries or change older release history, and use the local date only when required by the project's convention.
5. Search for references to the old version and update only those that are intended to track this project release. Preserve pinned references that intentionally remain on an already published version.

## Validation

- Run the project's relevant metadata validation, build, or test command and confirm it reports the target version.
- Search the relevant project files for unintended references to the old version.
- Run `git diff --check` and review the complete diff to confirm only intended files changed.

Do not commit, tag, publish, or create a release unless the user explicitly asks.
