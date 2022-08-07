
[CmdletBinding()]
param (
    [Parameter()]
    [int] $BuildNumber
)

$ModuleName = 'PsBuildTasks'

. $PSScriptRoot/tasks/PowerShell-Matrix.Tasks.ps1
. $PSScriptRoot/tasks/Build.Tasks.ps1

task InstallBuildDependencies {
    Install-Module platyPs -Scope CurrentUser
}
task InstallTestDependencies {}
task InstallReleaseDependencies {}