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

Go to the project root directory

```powershell
Import-Module -Name PsBuildTasks
Install-PsBuildTask -Path . -Task PowerShell-Matrix
$ModuleName = 'MyModuleName'
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks
```

## Update development version

You can update PsBuildTasks from a branch of choice using:

```powershell
$PsBuildTaskBranch = 'develop'; Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasksTasks; Invoke-Build UpdatePsBuildTasks
```

## Changelog

See the [changelog](./CHANGELOG.md) file.
