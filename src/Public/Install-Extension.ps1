function Install-Extension {

    <#
    
    .SYNOPSIS
    Installs a PsBuildTasks extension

    #>

    [CmdletBinding()]
    param (
        # Path to the tasks directory.
        [Parameter( Mandatory )]
        [System.IO.DirectoryInfo] $Path,

        # URL to the git repository.
        [Parameter( Mandatory )]
        [string] $Repository
    )

    Join-Path $Path tasks | Push-Location
    git submodule add $Repository
    Pop-Location

}