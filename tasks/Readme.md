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

### PowerShell Matrix

Use this container task for PowerShell modules that support Windows and Linux:

```powershell
task UpdatePsBuildTasksTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/tasks/PowerShell-Matrix.Tasks.ps1' `
        -OutFile "$PSScriptRoot\tasks\PsBuild.Tasks.ps1"
}
```

### PowerShell Windows-only

Use this container task for PowerShell modules that only support Windows:

```powershell
task UpdatePsBuildTasksTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/tasks/PowerShell-Windows.Tasks.ps1' `
        -OutFile "$PSScriptRoot\tasks\PsBuild.Tasks.ps1"
}
```

### DotNet

Use this container task for DotNet modules that support Windows and Linux:

```powershell
task UpdatePsBuildTasksTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/tasks/Dotnet-Matrix.Tasks.ps1' `
        -OutFile "$PSScriptRoot\tasks\PsBuild.Tasks.ps1"
}
```

## Architecture Decision Records

The task templates provide `UpdateAdrTemplate` to copy the shared ADR template to
`adr/adr-template.md` in the consuming project. It creates the `adr` directory when needed
and overwrites an existing template. The task runs as part of `UpdatePsBuildTasks` and can
also be run on its own:

```powershell
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdateAdrTemplate
```

## GitHub Copilot

The task templates also provide an `UpdateCopilot` task for copying shared instructions, agents, and skills into `.github`. It runs as part of `UpdatePsBuildTasks` and can also be run on its own.

Refresh the project-specific container task first, then run the Copilot update task:

```powershell
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdatePsBuildTasksTasks
Invoke-Build -File .\tasks\PsBuild.Tasks.ps1 -Task UpdateCopilot
```

Only files managed by PsBuildTasks are overwritten; unrelated files under `.github/instructions`, `.github/agents`, and `.github/skills` are left untouched.
