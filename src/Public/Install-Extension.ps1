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

        # Name of the extension.
        [Parameter( Mandatory )]
        [string] $Name,

        # URL to the git repository.
        [Parameter( Mandatory )]
        [string] $Repository,

        # Branch name to use.
        [Parameter()]
        [string] $Branch = 'main'
    )

    [System.IO.DirectoryInfo] $SqlServerSamplesDirectory = Join-Path $Path tasks $Name

    New-Item $SqlServerSamplesDirectory -ItemType Directory -ErrorAction Continue

    Push-Location $SqlServerSamplesDirectory
    try {
        git init
        git remote add origin -f $Repository
        git checkout $Branch
    }
    finally {
        Pop-Location
    }
}