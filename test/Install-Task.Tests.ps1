#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Install-Task {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsBuildTasks.psd1 -Force -ErrorAction Stop -PassThru
    }

    It exists {
        Get-Command -Module PsBuildTasks -Name Install-PsBuildTask -ErrorAction Stop
    }

    It PowerShell-Matrix {
        Install-PsBuildTask -Path "TestDrive:\" -Task PowerShell-Matrix -ErrorAction Stop
        "TestDrive:\tasks\PsBuild.Tasks.ps1" | Should -Exist
    }

    It Dotnet-Matrix {
        Install-PsBuildTask -Path "TestDrive:\" -Task Dotnet-Matrix -ErrorAction Stop
        "TestDrive:\tasks\PsBuild.Tasks.ps1" | Should -Exist
    }
}