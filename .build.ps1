
<#
.SYNOPSIS
Defines the Invoke-Build tasks for the PsBuildTasks repository.

.DESCRIPTION
Loads the PowerShell matrix and module build task templates, sets the module
name, and configures build, test, and release dependencies.
#>
[CmdletBinding()]
param (
    # Optional build number used to set an alpha prerelease version.
    [Parameter()]
    [int] $BuildNumber,

    # PsBuildTasks repository branch used when updating shared project files. Defaults to main.
    [Parameter()]
    [string] $PsBuildTasksBranch
)

$ModuleName = 'PsBuildTasks'

. $PSScriptRoot/tasks/PowerShell-Matrix.Tasks.ps1
. $PSScriptRoot/tasks/Build.Tasks.ps1

task InstallBuildDependencies {
    Install-Module platyPs -Scope CurrentUser
}
task InstallTestDependencies {}
task InstallReleaseDependencies {}