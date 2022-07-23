function Install-Task {
    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [System.IO.DirectoryInfo] $Path,

        [Parameter( Mandatory )]
        [ValidateSet('PowerShell-Matrix', 'Dotnet-Matrix')]
        [string] $Task
    )

    $tasksDirectory = Join-Path $Path 'tasks'

    if ( -not ( Test-Path $tasksDirectory )) {
        New-Item -ItemType Directory $tasksDirectory
    }
    
    $taskFile = Join-Path $tasksDirectory 'PsBuild.Tasks.ps1'
    
    Invoke-WebRequest `
        -Uri "https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/tasks/$Task.Tasks.ps1" `
        -OutFile $taskFile
}