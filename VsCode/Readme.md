# VSCode Tasks

It provides tasks for the corresponding InvokeBuild Tasks.

## Available tasks

- **Build**, **Clean**, **Install**, and **Update docs** run the corresponding InvokeBuild tasks.
- **All Tests** runs the full Pester test suite.
- **Unit Tests** runs Pester tests tagged `UnitTest`.
- **Integration Tests** runs Pester tests tagged `IntegrationTest`.

All test tasks run `Build` first and execute Pester from the `test` directory. Run them from the VS Code Command Palette with **Tasks: Run Task**.

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
