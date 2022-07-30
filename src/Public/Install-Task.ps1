function Install-Task {

    <#

    .SYNOPSIS
    Install PsBuildTasks task file.

    .DESCRIPTION
    Downloads a task file and saves it to the tasks directory.

    #>

    [CmdletBinding()]
    param (
        # Path to the tasks directory.
        [Parameter( Mandatory )]
        [System.IO.DirectoryInfo] $Path,

        # Name of the task file to install.
        [Parameter( Mandatory )]
        [ValidateSet('PowerShell-Matrix', 'Dotnet-Matrix')]
        [string] $Task,

        # Specifies a revision by commit id.
        [Parameter()]
        [string] $Commit = 'main'
    )

    $tasksDirectory = Join-Path $Path 'tasks'

    if ( -not ( Test-Path $tasksDirectory )) {
        New-Item -ItemType Directory $tasksDirectory
    }
    
    $taskFile = Join-Path $tasksDirectory 'PsBuild.Tasks.ps1'
    
    Invoke-WebRequest `
        -Uri "https://raw.githubusercontent.com/abbgrade/PsBuildTasks/$Commit/tasks/$Task.Tasks.ps1" `
        -OutFile $taskFile
}