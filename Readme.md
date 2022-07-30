# PsBuildTasks

This provides reusable sources for build, test, release automation of PowerShell modules, written in DotNet/C# or PowerShell.

This includes:

- [InvokeBuild](https://github.com/nightroman/Invoke-Build) tasks.
- [GitHub Actions](https://docs.github.com/en/actions) workflows.

## Getting Started

There is a PowerShell module to manage PsBuildTasks and helps with it's installation.
Get it with `Install-Module -Name PsBuildTasks`.
The next step depends on your project.

1. If your project is written in PowerShell or DotNet/C#.
2. If your project supports only Windows or is cross platform and requires matrix tests on Windows and Linux.

There are container tasks that update multiple features of PsBuildTasks

### PowerShell Matrix

Go to the project root directory

```powershell
Import-Module -Name PsBuildTasks
Install-PsBuildTask -Path . -Task PowerShell-Matrix
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasks
```

## InvokeBuild Tasks

It provides the following tasks:

- Build *<- creates the module and documentation/help. The help is based on [platyPS](https://github.com/PowerShell/platyPS)*
- Clean *<- removes temporary files*
- Install *<- installs the modules to the default powershell module path*
- Publish *<- publishes the module to PowerShellGallery*

### Usage

- Add one of the following tasks to your `.build` file.
- It requires the `$ModuleName` variable to be set.

#### DotNet Modules

- It requires the `$Configuration` variable to be set.
- It expects a `src` directory, that contains the manifest file.
- The module will be build to the `publish` directory.
- The documentation will be created in the `docs` directory.

Add the following task to your `.build.ps1` file to create/update your build tasks.

```powershell
task UpdateBuildTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/DotNet/Build.Tasks.ps1' `
        -OutFile "$PSScriptRoot\tasks\Build.Tasks.ps1"
}
```

#### Powershell

- It expects a `src` directory, that contains the manifest file.
- The module will be build to the `publish` directory.
- The documentation will be created in the `docs` directory.

Add the following task to your `.build.ps1` file to create/update your build tasks.

```powershell
task UpdateBuildTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/Powershell/Build.Tasks.ps1' `
        -OutFile "$PSScriptRoot\tasks\Build.Tasks.ps1"
}
```

## GitHub Actions workflows

It provides the following workflows:

- build-validation *<- builds the project using the `Build` task, runs [Pester](https://github.com/pester/Pester) as matrix and creates a [test report](https://github.com/zyborg/pester-tests-report).*
- pre-release *<- builds the project and publishes it to PowerShell Gallery as prerelease.*
- release *<- builds the project and publishes it to PowerShell Gallery.*

It depends on a convention for branch names. These are based on the default settings of the [git-flow](https://github.com/nvie/gitflow) git extension.

### Usage

- It expects a `InstallBuildDependencies` task which installs modules, required to build the module.
- It expects a `Build` that builds the module into the `publish` directory.
- It expects a `InstallTestDependencies` task which installs modules, required to test the module.
- It expects Pester tests in the `test` directory.
- It expects a `InstallReleaseDependencies` task which installs modules, required to import/publish the module.

#### Build Validation Workflow

Add the following task to your `.build.ps1` file to create/update your workflow.

```powershell
task UpdateValidationWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/build-validation-matrix.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\build-validation.yml"
}
```

#### Pre-Release  Workflow

1. Execute the following snippet to initialize or update the pre-release workflow:

```powershell
task UpdatePreReleaseWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/pre-release-windows.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\pre-release.yml"
}
```

2. Update the `module-name` input in the workflow.
3. Configure the repository secret `PS_GALLERY_KEY` with a [PowerShell Gallery API key](https://docs.microsoft.com/en-us/powershell/scripting/gallery/how-to/managing-profile/creating-apikeys).

#### Release  Workflow

1. Execute the following snippet to initialize or update the release workflow:

```powershell
task UpdateReleaseWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/release-windows.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\release.yml"
}
```

2. Update the `module-name` input in the workflow.
3. Configure the repository secret `PS_GALLERY_KEY` with a [PowerShell Gallery API key](https://docs.microsoft.com/en-us/powershell/scripting/gallery/how-to/managing-profile/creating-apikeys).

## VSCode Tasks

It provides tasks for the corresponding InvokeBuild Tasks.

### Usage

- Add the following task to your `.build.ps1` file to create/update your vscode tasks.
- It expects the InvokeBuild Tasks tasks to be set up.

```powershell
task UpdateVsCodeTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/VsCode\tasks.json' `
        -OutFile "$PSScriptRoot\.vscode\tasks.json"
}
```

## Container Tasks

To update all build tasks, add and use one of the following task:

### PowerShell

```powershell
task UpdatePsBuildTasksTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/tasks/PowerShell-Matrix.Tasks.ps1' `
        -OutFile "$PSScriptRoot\tasks\PsBuild.Tasks.ps1"
}
```

### DotNet

```powershell
task UpdatePsBuildTasksTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/tasks/Dotnet-Matrix.Tasks.ps1' `
        -OutFile "$PSScriptRoot\tasks\PsBuild.Tasks.ps1"
}
```

## Changelog

See the [changelog](./CHANGELOG.md) file.
