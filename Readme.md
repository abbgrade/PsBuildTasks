# Readme

[![.github/workflows/build-validation.yml](https://github.com/abbgrade/PsBuildTasks/actions/workflows/build-validation.yml/badge.svg)](https://github.com/abbgrade/PsBuildTasks/actions/workflows/build-validation.yml)

PsBuildTasks helps keep the shared build, test, and release boilerplate in sync across PowerShell module projects. Install its task and workflow templates into each project, then use the update tasks to refresh those shared files as they evolve. It supports modules written in PowerShell or .NET/C#.

This includes:

- [InvokeBuild](https://github.com/nightroman/Invoke-Build) tasks. [Details](./tasks/Readme.md).
- [GitHub Actions](https://docs.github.com/en/actions) workflows. [Details](./GitHub/Readme.md).
- [VsCode Tasks](https://code.visualstudio.com/docs/editor/tasks) workflows. [Details](./VsCode/Readme.md).
- [GitHub Copilot instructions, agents, and skills](./tasks/Readme.md#github-copilot-files) that can be copied into consuming projects and updated independently.
- A PowerShell module for installation and updates. See [the command reference](./docs/) for descriptions and examples.

For details, visit the [GitHub Pages](https://abbgrade.github.io/PsBuildTasks/).

## Getting Started

The PsBuildTasks PowerShell module helps install and manage PsBuildTasks.
Install it with `Install-Module -Name PsBuildTasks` from [PsGallery](https://www.powershellgallery.com/packages/PsBuildTasks).
Choose a task template based on your project's language and supported platforms:

- Cross-platform PowerShell module: use [PowerShell-Matrix](./tasks/PowerShell-Matrix.Tasks.ps1) for Windows and Linux matrix tests.
- Windows-only PowerShell module: use [PowerShell-Windows](./tasks/PowerShell-Windows.Tasks.ps1).
- .NET/C# module: use [Dotnet-Matrix](./tasks/Dotnet-Matrix.Tasks.ps1).

See the [InvokeBuild task guide](./tasks/Readme.md) for setup details. The module's container tasks can then update the build, workflow, and other PsBuildTasks files.

### PowerShell Matrix

Go to the project root directory and execute the following script.
Make sure to save your existing code in git, since files may be overwritten.

```powershell
Import-Module -Name PsBuildTasks
Install-PsBuildTask -Path . -Task PowerShell-Matrix
$ModuleName = ( Get-Location | Get-Item ).Name

Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks

Set-Content -Path .build.ps1 -Value @"
[CmdletBinding()]
param (
    [Parameter()]
    [int] $BuildNumber
)

`$ModuleName = '$ModuleName'

. `$PSScriptRoot/tasks/Build.Tasks.ps1
. `$PSScriptRoot/tasks/PsBuild.Tasks.ps1

task InstallModuleDependencies -Jobs {}
task InstallBuildDependencies -Jobs InstallModuleDependencies, {
    Install-Module platyPs
}
task InstallTestDependencies -Jobs InstallModuleDependencies, {}
task InstallReleaseDependencies -Jobs InstallModuleDependencies, {}
"@
```

In case you start a module from scratch, create a module structure like this.

```powershell
New-Item src -ItemType Directory
New-ModuleManifest -Path src/$ModuleName.psd1 -RootModule "$ModuleName.psm1"
$local:manifest = Get-Content -Path src/$ModuleName.psd1 | ForEach-Object {
    $_ -Replace 'FunctionsToExport', '# FunctionsToExport' -Replace 'CmdletsToExport', '# CmdletsToExport' -Replace 'VariablesToExport', '# VariablesToExport' -Replace 'AliasesToExport', '# AliasesToExport'
}
$local:manifest | Set-Content -Path src/$ModuleName.psd1
New-Item src/Internal -ItemType Directory
New-Item src/Public -ItemType Directory
New-Item test -ItemType Directory
```

### PowerShell Windows-only

For a Windows-only module, install the Windows container task and use it to update the project files:

```powershell
Import-Module -Name PsBuildTasks
Install-PsBuildTask -Path . -Task PowerShell-Windows
$ModuleName = ( Get-Location | Get-Item ).Name
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks
```

Create `.build.ps1` with the same PowerShell configuration shown above: set `$ModuleName`, dot-source `tasks/Build.Tasks.ps1` and `tasks/PsBuild.Tasks.ps1`, and define the dependency tasks.

### .NET/C#

The .NET build tasks expect the project under `src/<ModuleName>` and the published output to contain `<ModuleName>.psd1`. Place the manifest beside the project file and configure the project to copy it to publish output. For example, add this to `<ModuleName>.csproj`:

```xml
<ItemGroup>
  <None Update="MyModuleName.psd1">
    <CopyToPublishDirectory>PreserveNewest</CopyToPublishDirectory>
  </None>
</ItemGroup>
```

Replace `MyModuleName` with the module name. Install the .NET matrix task and update the project task files:

```powershell
Import-Module -Name PsBuildTasks
Install-PsBuildTask -Path . -Task Dotnet-Matrix
$ModuleName = ( Get-Location | Get-Item ).Name
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks
```

Create `.build.ps1` with the required module name and build configuration, and define the dependency tasks:

```powershell
[CmdletBinding()]
param (
    [int] $BuildNumber,
    [string] $Configuration = 'Release'
)

$ModuleName = 'MyModuleName' # Replace with the module name and src subdirectory.

. $PSScriptRoot/tasks/Build.Tasks.ps1
. $PSScriptRoot/tasks/PsBuild.Tasks.ps1

task InstallBuildDependencies {
    Install-Module platyPs -Scope CurrentUser
}
task InstallTestDependencies {}
task InstallReleaseDependencies {}
```

## Keep project boilerplate in sync

Each project contains its own copies of the shared task and supporting files. Run these commands in a project to refresh those files from the PsBuildTasks repository; they do not update the installed PsBuildTasks PowerShell module. Review the changes because project files may be overwritten. The update tasks use the `main` branch by default. To update your project files from `main`, run:

```powershell
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasksTasks; Invoke-Build  -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks
```

To use a different branch, set `$PsBuildTaskBranch` before running the update tasks:

```powershell
$PsBuildTaskBranch = 'develop'; Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasksTasks; Invoke-Build  -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks
```

### GitHub Copilot files

Each task template provides an `UpdateCopilot` task that copies shared files into `.github/instructions/`, `.github/agents/`, and `.github/skills/`. It runs as part of `UpdatePsBuildTasks` and can also be run on its own.

First refresh the project-specific container task, then run the Copilot update task:

```powershell
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasksTasks
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdateCopilot
```

The task overwrites the files managed by PsBuildTasks and leaves unrelated Copilot files untouched. Review the changes before committing them.

## Changelog

See the [changelog](./CHANGELOG.md) file.
