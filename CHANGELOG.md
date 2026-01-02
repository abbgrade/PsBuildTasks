# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.14.2] - 2026-01-02

### Fixed

- Updated version references.

## [1.14.1] - 2026-01-02

### Fixed

- Added default for not required input.

## [1.14.0] - 2026-01-02

### Changed

- Split release and release hotfix jobs.

## [1.13.0] - 2026-01-02

### Fixed

- Moved hotfix release from main to hotfix branch.

## [1.12.0] - 2025-12-18

### Changed

- Updated github action tasks
  - `actions/checkout` to v6.
  - `actions/configure-pages` to v5.
  - `actions/upload-pages-artifact` to v4.
  - `actions/deploy-pages` to v4.
  - `actions/upload-artifact` to v6.
  - `actions/download-artifact` to v7.

## [1.11.1] - 2025-12-08

### Fix

- Hotfix branches trigger now pre-releases.

## [1.11.0] - 2024-10-08

### Changed

- Updated github action tasks `actions/checkout`, `actions/upload-artifact`, `actions/download-artifact` to v4.

## [1.10.0] - 2023-06-08

### Added

- PowerShell script module template.

### Changed

- Replaced github action pester report

## [1.9.0] - 2023-03-23

### Added

- Build GitHub Pages workflow.

## [1.8.0] - 2023-02-16

### Changed

- Updated outdated github actions.
- Enabled recursive git checkout including submodules.

## [1.7.0] - 2023-02-13

### Added

- Added watermark to build tasks file.
- Verbose output to custom scripts in Github workflows.

### Fixed

- Fixed install task for linux.

## [1.6.0] - 2022-09-29

### Added

- Added tasks file for powershell modules with only windows support.

## [1.5.1] - 2022-09-11

### Fixed

- Powershell build script had linux incompatible file separators.

## [1.5.0] - 2022-08-07

### Added

- Branch config for Dotnet matrix.
- Launch config for .Net debugging.

## [1.4.0] - 2022-08-07

### Added

- Branch config for PowerShell matrix.

### Fixed

- Fixed PowerShell clean removed doc index and config.

## [1.3.0] - 2022-07-31

### Added

- Install extension command.

## [1.2.0] - 2022-07-30

### Added

- Update tasks.
- GitHub Pages config.
- Dependabot config.
- PowerShell module with install command.

### Fixed

- Dotnet-Matrix.Tasks does not fail in empty project.
- PowerShell-Matrix.Tasks does not fail in empty project.
- Wrong file separators for linux.

## [1.1.0] - 2022-03-19

### Added

- Added test reports to pester tests.

## [1.0.0] - 2022-03-13

### Added

- VSCode Tasks.
- GitHub Action Workflows.

<!-- markdownlint-configure-file {"MD024": { "siblings_only": true } } -->
