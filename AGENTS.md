# Repository Guidelines

## Project Structure & Module Organization
- `Sources/` holds the SwiftSM library code. Core types live under `Sources/Redux/`, with errors in `Sources/Error/`.
- `Tests/` contains the SwiftPM test target (`SwiftSMTests`) and sample fixtures under `Tests/ReduxTests/`.
- `Example/` is a Tuist-based sample app (`Example/Sources/App/`) used for manual validation.
- Root configs: `Package.swift` for SwiftPM, `Tuist.swift` and `Workspace.swift` for Tuist generation.

## Build, Test, and Development Commands
- `swift build`: builds the SwiftPM library target.
- `swift test`: runs the `SwiftSMTests` suite using Swift Testing.
- `./setup.sh`: installs Tuist via mise (if needed) and regenerates workspace/projects.
- `tuist generate`: regenerates the Example workspace if Tuist is already installed.

## Coding Style & Naming Conventions
- Swift 6 codebase, 2-space indentation, braces on the same line.
- Types and protocols use PascalCase; functions and properties use lowerCamelCase.
- Actions conform to `ReduxAction` and must provide `id`, `description`, and `debugDescription`.
- Reducers and middleware should use stable `id` strings for logging, e.g., `Reducer<AppState, AppAction>(id: "AppReducer")`.
- Store and state APIs are `@MainActor`; keep calls on the main actor unless explicitly designed otherwise.

## Testing Guidelines
- Tests use the `Testing` framework with `@Test` functions inside a test `struct`.
- Place new tests in `Tests/ReduxTests` and keep test names descriptive (behavior first).
- For async middleware, prefer deterministic waits such as `await Task.yield()` or `Task.sleep`.

## Commit & Pull Request Guidelines
- Commit messages are short, imperative sentences (e.g., "Update README.md").
- Pull requests should include a concise summary, the tests run (e.g., `swift test`), and screenshots for UI changes in the Example app.

## Agent Notes
- Use `rg` for searching the repository.
- Avoid wrapping imports in try/catch blocks.
