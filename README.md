# Project Title

This document provides instructions on setting up Flutter and running the associated mobile application. Please follow the steps below to ensure a smooth setup and execution process.

## Prerequisites

Before you begin, ensure you have the following installed:
- Git (for cloning the repository)
- An IDE (like Android Studio, VS Code, etc.)
- Flutter SDK

## Setting Up Flutter

1. **Install Flutter SDK**: 
   - Visit the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
   - Choose your operating system (Windows/Mac/Linux) and follow the provided instructions.

2. **Verify Installation**:
   - After installation, run `flutter doctor` in your terminal or command prompt.
   - This command checks your environment and displays a report to the terminal window.
   - Ensure there are no issues (like missing dependencies).

3. **Set up an Editor**:
   - Install an IDE if you haven’t already. We recommend Android Studio or Visual Studio Code.
   - For Android Studio, install the Flutter and Dart plugins.
   - For VS Code, install the Flutter extension.

## Cloning the Repository

1. **Clone the Repository**:
   - Use `git clone https://github.com/flippi321/Sodukoid` to clone the project repository to your local machine.

2. **Navigate to the Project Directory**:
   - Use `cd sodukoid` to move into the project directory.

## Running the App

1. **Get Dependencies**:
   - Run `flutter pub get` in the terminal to fetch the project dependencies.

2. **Open an Emulator**:
   - Start an Android or iOS emulator.
   - You can do this through your IDE or by running an emulator directly from the Android SDK or iOS Simulator.

3. **Run the App**:
   - Use `flutter run` in the terminal while in the project directory.
   - This command will build the app and install it on the running emulator.
   - Alternatively, use your IDE’s run functionality.

## Troubleshooting

- **Flutter Doctor**: If you encounter issues, re-run `flutter doctor` to identify any setup problems.
- **Emulator Issues**: Ensure your emulator is correctly set up and running before executing `flutter run`.
- **Dependency Issues**: If dependency errors occur, verify your `pubspec.yaml` file and run `flutter pub get` again.

## Further Help

For more information and troubleshooting, visit the [Flutter documentation](https://flutter.dev/docs).
