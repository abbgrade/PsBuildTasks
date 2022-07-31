#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Install-Extension {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsBuildTasks.psd1 -Force -ErrorAction Stop -PassThru
    }

    It exists {
        Get-Command -Module PsBuildTasks -Name Install-PsBuildExtension -ErrorAction Stop
    }

    Context Project {

        BeforeAll {
            $ProjectPath = "TestDrive:\"
            Install-PsBuildTask -Path $ProjectPath -Task PowerShell-Matrix
            Push-Location $ProjectPath
            git init
            Pop-Location
        }

        It works {
            Install-PsBuildExtension `
                -Path $ProjectPath `
                -Repository 'https://github.com/abbgrade/PsSqlTestTasks.git' `
                -ErrorAction Stop

            $ExtensionPath = Join-Path $ProjectPath tasks PsSqlTestTasks
            $ExtensionPath | Should -Exist

            $TaskPath = Join-Path $ExtensionPath WideWorldImporters.Tasks.ps1
            $TaskPath | Should -Exist

            $GitModules = Join-Path $ProjectPath .gitmodules
            $GitModules | Should -Exist
        }

    }

}