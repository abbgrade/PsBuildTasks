#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Install-Task {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsBuildTasks.psd1 -Force -ErrorAction Stop -PassThru
    }

    It exists {
        # Act
        $command = Get-Command -Module PsBuildTasks -Name Install-PsBuildTask -ErrorAction Stop

        # Assert
        $command | Should -Not -BeNullOrEmpty
    }

    It PowerShell-Matrix {
        # Arrange
        $projectPath = "TestDrive:\PowerShell-Matrix"
        New-Item -ItemType Directory -Path $projectPath | Out-Null

        # Act
        Install-PsBuildTask -Path $projectPath -Task PowerShell-Matrix -ErrorAction Stop

        # Assert
        "$projectPath\tasks\PsBuild.Tasks.ps1" | Should -Exist
    }

    It Dotnet-Matrix {
        # Arrange
        $projectPath = "TestDrive:\Dotnet-Matrix"
        New-Item -ItemType Directory -Path $projectPath | Out-Null

        # Act
        Install-PsBuildTask -Path $projectPath -Task Dotnet-Matrix -ErrorAction Stop

        # Assert
        "$projectPath\tasks\PsBuild.Tasks.ps1" | Should -Exist
    }

    It PowerShell-Windows {
        # Arrange
        $projectPath = "TestDrive:\PowerShell-Windows"
        New-Item -ItemType Directory -Path $projectPath | Out-Null

        # Act
        Install-PsBuildTask -Path $projectPath -Task PowerShell-Windows -ErrorAction Stop

        # Assert
        "$projectPath\tasks\PsBuild.Tasks.ps1" | Should -Exist
    }

    It PowerShell-Matrix-Commit {
        # Arrange
        $projectPath = "TestDrive:\PowerShell-Matrix-Commit"
        New-Item -ItemType Directory -Path $projectPath | Out-Null

        # Act
        Install-PsBuildTask -Path $projectPath -Task PowerShell-Matrix -Commit 'fb0767a258df19fb95f75f5cd96e14cc43e37bf8' -ErrorAction Stop

        # Assert
        "$projectPath\tasks\PsBuild.Tasks.ps1" | Should -Exist
    }

    It Dotnet-Matrix-Commit {
        # Arrange
        $projectPath = "TestDrive:\Dotnet-Matrix-Commit"
        New-Item -ItemType Directory -Path $projectPath | Out-Null

        # Act
        Install-PsBuildTask -Path $projectPath -Task Dotnet-Matrix -Commit 'fb0767a258df19fb95f75f5cd96e14cc43e37bf8' -ErrorAction Stop

        # Assert
        "$projectPath\tasks\PsBuild.Tasks.ps1" | Should -Exist
    }

    It PowerShell-Windows-Commit {
        # Arrange
        $projectPath = "TestDrive:\PowerShell-Windows-Commit"
        New-Item -ItemType Directory -Path $projectPath | Out-Null

        # Act
        Install-PsBuildTask -Path $projectPath -Task PowerShell-Windows -Commit 'f498fc9dd313bf7d33de67e15e205a7170562af0' -ErrorAction Stop

        # Assert
        "$projectPath\tasks\PsBuild.Tasks.ps1" | Should -Exist
    }
}