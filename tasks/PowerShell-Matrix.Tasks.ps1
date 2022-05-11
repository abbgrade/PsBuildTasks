#region InvokeBuild

task UpdateBuildTasks {
	Invoke-WebRequest `
		-Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/Powershell/Build.Tasks.ps1' `
		-OutFile "$PSScriptRoot\Tasks\Build.Tasks.ps1"
}

#endregion
#region GitHub Actions

task UpdateValidationWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/build-validation-matrix.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\build-validation.yml"
}

task UpdatePreReleaseWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/pre-release-windows.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\pre-release.yml"
}

task UpdateReleaseWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/release-windows.yml' `
        -OutFile "$PSScriptRoot\.github\workflows\release.yml"
}

#endregion
#region VsCode

task UpdateVsCodeTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/VsCode/tasks.json' `
        -OutFile "$PSScriptRoot\.vscode\tasks.json"
}

#endregion
#region PsBuildTasks

task UpdatePsBuildTasksTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/tasks/PowerShell-Matrix.Tasks.ps1' `
        -OutFile "$PSScriptRoot\tasks\PsBuild.Tasks.ps1"
}

#endregion

task UpdatePsBuildTasks -Jobs UpdateBuildTasks, UpdateValidationWorkflow, UpdatePreReleaseWorkflow, UpdateReleaseWorkflow, UpdateVsCodeTasks, UpdatePsBuildTasksTasks
