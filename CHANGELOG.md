# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
