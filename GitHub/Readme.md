# GitHub Actions workflows

It provides the following workflows:

- `build-validation-matrix.yml` *<- runs matrix-based build and Pester validation and creates a [test report](https://github.com/zyborg/pester-tests-report). Runs on pushes to `develop`, `bugfix/*`, `feature/*`, `release/*`, and `dependabot/*`, pull requests to `develop`, or manual dispatch.*
- `build-validation-windows.yml` *<- runs Windows build and test validation on the same branches and pull requests, or by manual dispatch.*
- `pre-release-windows.yml` *<- builds and publishes a prerelease to PowerShell Gallery on pushes to `release/*` or by manual dispatch.*
- `release-windows.yml` *<- builds and publishes a release to PowerShell Gallery on pushes to `main` or by manual dispatch; publication is not forced.*
- `release-hotfix-windows.yml` *<- publishes hotfixes to PowerShell Gallery on pushes to `hotfix/*` or by manual dispatch, with publication forced.*

It depends on a convention for branch names. These are based on the default settings of the [git-flow](https://github.com/nvie/gitflow) git extension.

## Usage

- It expects an `InstallBuildDependencies` task which installs modules required to build the module.
- It expects a `Build` task that builds the module into the `publish` directory.
- It expects an `InstallTestDependencies` task which installs modules required to test the module.
- It expects Pester tests in the `test` directory.
- It expects an `InstallReleaseDependencies` task which installs modules required to import/publish the module.

### Build Validation Workflow

Both validation workflows run on pushes to `develop`, `bugfix/*`, `feature/*`, `release/*`, and `dependabot/*`, on pull requests targeting `develop`, and when manually started from the Actions tab.

Add the following task to your `.build.ps1` file to create/update the matrix validation workflow:

```powershell
task UpdateValidationWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/build-validation-matrix.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\build-validation.yml"
}
```

To use the Windows-only validation workflow instead, add:

```powershell
task UpdateValidationWindowsWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/build-validation-windows.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\build-validation-windows.yml"
}
```

### Pre-Release Workflow

This workflow runs on pushes to `release/*` branches or when manually started from the Actions tab, and publishes a prerelease to PowerShell Gallery.

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

### Hotfix Release Workflow

This workflow runs on pushes to `hotfix/*` branches or when manually started from the Actions tab. It uses the release workflow with `force-publish` set to `true`.

1. Add the hotfix workflow to your repository:

```powershell
task UpdateHotfixReleaseWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/release-hotfix-windows.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\release-hotfix.yml"
}
```

2. Update the `module-name` input in the workflow.
3. Configure the repository secret `PS_GALLERY_KEY` with a [PowerShell Gallery API key](https://docs.microsoft.com/en-us/powershell/scripting/gallery/how-to/managing-profile/creating-apikeys).

### Release Workflow

This workflow runs on pushes to `main` or when manually started from the Actions tab. Its `force-publish` input is `false`, allowing the reusable workflow to decide whether to publish.

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
