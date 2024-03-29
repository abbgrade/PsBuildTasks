# Readme

PsBuildTasks provides reusable sources for build, test, release automation of PowerShell modules, written in DotNet/C# or PowerShell.

This includes:

- [InvokeBuild](https://github.com/nightroman/Invoke-Build) tasks. [Details](./tasks/Readme.md).
- [GitHub Actions](https://docs.github.com/en/actions) workflows. [Details](./GitHub/Readme.md).
- [VsCode Tasks](https://code.visualstudio.com/docs/editor/tasks) workflows. [Details](./VsCode/Readme.md).
- A PowerShell module for installation and updates. See [the command reference](./docs/) for descriptions and examples.

For details, visit the [GitHub Pages](https://abbgrade.github.io/PsBuildTasks/).

## Getting Started

There is a PowerShell module to manage PsBuildTasks and helps with it's installation.
Get it with `Install-Module -Name PsBuildTasks` from from [PsGallery](https://www.powershellgallery.com/packages/PsBuildTasks).
The next step depends on your project.

1. If your project is written in PowerShell or DotNet/C#.
2. If your project supports only Windows or is cross platform and requires matrix tests on Windows and Linux.

There are container tasks that update multiple features of PsBuildTasks

### PowerShell Matrix

Go to the project root directory and execute the following script.
Make sure to save your existing code in git, since files may be overwritten.

```powershell
Import-Module -Name PsBuildTasks
Install-PsBuildTask -Path . -Task PowerShell-Matrix
$ModuleName = ( Get-Location | Get-Item ).Name

Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks

Set-Content -Path .build.ps1 -Value @"
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

## Update development version

You can update PsBuildTasks to:

the latest stable version using:

```powershell
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasksTasks; Invoke-Build  -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks
```

a branch of choice using:

```powershell
$PsBuildTaskBranch = 'develop'; Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasksTasks; Invoke-Build  -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks
```

## Changelog

See the [changelog](./CHANGELOG.md) file.
