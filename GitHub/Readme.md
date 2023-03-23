# GitHub Actions workflows

It provides the following workflows:

- build-validation *<- builds the project using the `Build` task, runs [Pester](https://github.com/pester/Pester) as matrix and creates a [test report](https://github.com/zyborg/pester-tests-report).*
- pre-release *<- builds the project and publishes it to PowerShell Gallery as prerelease.*
- release *<- builds the project and publishes it to PowerShell Gallery.*

It depends on a convention for branch names. These are based on the default settings of the [git-flow](https://github.com/nvie/gitflow) git extension.

## Usage

- It expects a `InstallBuildDependencies` task which installs modules, required to build the module.
- It expects a `Build` that builds the module into the `publish` directory.
- It expects a `InstallTestDependencies` task which installs modules, required to test the module.
- It expects Pester tests in the `test` directory.
- It expects a `InstallReleaseDependencies` task which installs modules, required to import/publish the module.

### Build Validation Workflow

Add the following task to your `.build.ps1` file to create/update your workflow.

```powershell
task UpdateValidationWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/build-validation-matrix.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\build-validation.yml"
}
```

### Pre-Release Workflow

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

### Release Workflow

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
