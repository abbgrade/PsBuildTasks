# PsBuildTasks

This provides general purpose [InvokeBuild tasks](https://github.com/nightroman/Invoke-Build) for Powershell.

## Usage

Add one of the following tasks to your `.build` file.
It requires the `$ModuleName` variable to be set.

### DotNet Modules

```powershell
task UpdateBuildTasks {
	Invoke-WebRequest `
		-Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/DotNet/Build.Tasks.ps1' `
		-OutFile "$PSScriptRoot\tasks\Build.Tasks.ps1"
}
```
