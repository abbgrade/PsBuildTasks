# VSCode Tasks

It provides tasks for the corresponding InvokeBuild Tasks.

## Usage

- Add the following task to your `.build.ps1` file to create/update your vscode tasks.
- It expects the InvokeBuild Tasks tasks to be set up.

```powershell
task UpdateVsCodeTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/VsCode\tasks.json' `
        -OutFile "$PSScriptRoot\.vscode\tasks.json"
}
```
