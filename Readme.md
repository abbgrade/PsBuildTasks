# PsBuildTasks

This provides reusable sources for build, test, release automation of PowerShell modules, written in DotNet/C# or PowerShell.

This includes:

- [InvokeBuild](https://github.com/nightroman/Invoke-Build) tasks.
- [GitHub Actions](https://docs.github.com/en/actions) workflows.

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

- It expects a `Source` directory, that contains the manifest file.
- The module will be build to the `Publish` directory.
- The documentation will be created in the `Docs` directory.

Add the following task to your `.build.ps1` file to create/update your build tasks.

```powershell
task UpdateBuildTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/Powershell/Build.Tasks.ps1' `
        -OutFile "$PSScriptRoot\Tasks\Build.Tasks.ps1"
}
```

## GitHub Actions workflows

It provides the following workflows:

- build-validation *<- builds the project using the `Build` task, runs [Pester](https://github.com/pester/Pester) as matrix and uploads the test results.*
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
