
$ModuleName = 'PsBuildTasks'

. $PSScriptRoot/tasks/PowerShell-Matrix.Tasks.ps1
. $PSScriptRoot/tasks/Build.Tasks.ps1

task InstallBuildDependencies {}
task InstallTestDependencies {}
task InstallReleaseDependencies {}