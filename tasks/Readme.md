# InvokeBuild

## Build Tasks

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
