# Task Manager App

A modern, feature-rich task management application built with Flutter. Organize your tasks efficiently with a clean and intuitive interface that supports both light and dark themes.

## Features

- ✅ **Create Tasks**: Add new tasks with titles and optional descriptions
- ✅ **Task Management**: Mark tasks as complete or in progress
- ✅ **Search Functionality**: Quickly find tasks by searching through titles and descriptions
- ✅ **Task Organization**: Tasks are automatically organized into "In Progress" and "Completed" sections
- ✅ **Task Details**: View detailed information about each task including creation and completion dates
- ✅ **Local Storage**: All tasks are saved locally on your device using GetStorage
- ✅ **Dark/Light Theme**: Automatic theme switching based on system preferences
- ✅ **Modern UI**: Beautiful Material Design 3 interface with smooth animations
- ✅ **Splash Screen**: Polished app launch experience

## Screenshots

_Add screenshots of your app here_

## Getting Started

### Prerequisites

- Flutter SDK (3.10.3 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- iOS Simulator / Android Emulator or a physical device

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd task_manager_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── controller/          # State management controllers
│   ├── nav_controller.dart
│   └── task_controller.dart
├── model/              # Data models
│   └── task_model.dart
├── routes/             # App routing configuration
│   └── routes.dart
├── screens/            # UI screens
│   ├── home_view.dart
│   ├── splash_screen/
│   └── tasks_screen/
│       ├── tasks_view.dart
│       ├── add_task_view.dart
│       └── task_detail_view.dart
├── services/           # Business logic services
│   └── storage_service.dart
├── theme/              # App theming
│   └── app_theme.dart
├── widgets/            # Reusable widgets
│   └── appbar.dart
└── main.dart          # App entry point
```

## Dependencies

- **get**: ^4.7.3 - State management, dependency injection, and routing
- **get_storage**: ^2.1.1 - Fast, lightweight key-value storage
- **uuid**: ^4.5.2 - Unique identifier generation for tasks
- **flutter_native_splash**: ^2.4.7 - Native splash screen configuration

## Usage

### Adding a Task

1. Navigate to the "Add Task" screen
2. Enter a task title (required)
3. Optionally add a description
4. Tap "Add Task" to save

### Managing Tasks

- **View Tasks**: All tasks are displayed on the main screen, organized by status
- **Search Tasks**: Use the search bar to filter tasks by title or description
- **Mark Complete**: Tap on a task to view details and mark it as complete
- **Delete Tasks**: Remove tasks through the task details view

### Task Status

- **In Progress**: Active tasks that haven't been completed yet
- **Completed**: Tasks that have been marked as done, with completion timestamps

## Architecture

The app follows a clean architecture pattern:

- **Controllers**: Manage state using GetX reactive programming
- **Models**: Define data structures for tasks
- **Services**: Handle data persistence and business logic
- **Screens**: Present UI and handle user interactions
- **Widgets**: Reusable UI components

## Storage

Tasks are stored locally on the device using GetStorage, ensuring:
- Fast read/write operations
- No internet connection required
- Data persists across app restarts

## Theme

The app supports both light and dark themes, automatically switching based on your device's system preferences. The theme includes:
- Material Design 3 color scheme
- Semantic colors for task status (success, warning)
- Consistent styling across all screens

## Development

### Running Tests

```bash
flutter test
```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the MIT License.

## Author

Created with ❤️ using Flutter

---

For more information about Flutter, visit [flutter.dev](https://flutter.dev)
