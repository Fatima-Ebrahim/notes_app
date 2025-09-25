# Notes App - Flutter Client

This is a clean, scalable, and professional Flutter application that serves as a mobile and web client for the [Notes API Backend](https://github.com/your-username/notes-api). The app allows users to view a list of notes and add new ones by communicating with the REST API.

This project was built following modern Flutter development best practices, emphasizing a clear separation of concerns, scalable architecture, and robust state management.



## ✨ Key Features

-   **Scalable Architecture**: Built using a feature-first folder structure, making it easy to add new features and maintain existing ones.
-   **State Management**: Utilizes the `provider` package for simple and effective state management, decoupling the UI from the business logic.
-   **Separation of Concerns**: Each part of the app has a single responsibility (API calls, state management, UI rendering).
-   **Cross-Platform**: Designed to run smoothly on Web (Chrome), Android, and iOS from a single codebase.
-   **Clean Code**: The codebase is well-documented and follows effective Dart practices.

## 🛠️ Tech Stack

-   **Framework**: Flutter 3+
-   **Language**: Dart
-   **State Management**: `provider`
-   **HTTP Client**: `http` package
-   **Development Environment**: Visual Studio Code

---

## 🏛️ Project Architecture

The project follows a **feature-first** architecture to ensure modularity and scalability. All core logic is separated from feature-specific code.

```
lib/
├── core/                       // 🧠 Code shared across all features
│   ├── api/
│   │   └── api_service.dart      // Handles all HTTP communication with the backend
│   └── models/
│       └── note.dart             // Defines the Note data structure
│
├── features/                   // 📦 Each folder is a self-contained feature
│   └── notes/                  // All code related to the "Notes" feature
│       ├── providers/
│       │   └── note_provider.dart  // Manages the state for the notes feature
│       ├── screens/
│       │   └── notes_screen.dart   // The main screen for displaying notes
│       └── widgets/
│           └── add_note_dialog.dart  // The dialog widget for adding a new note
│
└── main.dart                   // 🚀 The application's entry point
```

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

### Prerequisites

-   Flutter SDK (version 3.0.0 or higher)
-   Visual Studio Code (recommended) with the Dart and Flutter extensions.
-   A running instance of the [Notes API Backend](https://github.com/your-username/notes-api).

### Installation & Configuration

1.  **Clone the repository:**
    ```bash
    git clone <your-flutter-repository-url>
    cd notes_client_flutter
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  ** VERY IMPORTANT: Configure the API endpoint:**
    You must tell the app where the backend API is running.

    -   Open the file: `lib/core/api/api_service.dart`
    -   Find the `_baseUrl` constant and change the IP address to match your setup:

    ```dart
    // For testing with a local web build (Chrome)
    static const String _baseUrl = '[http://127.0.0.1:8000/api](http://127.0.0.1:8000/api)';

    // For testing with the Android Emulator
    // static const String _baseUrl = '[http://10.0.2.2:8000/api](http://10.0.2.2:8000/api)';

    // For testing with a physical device (use your PC's local network IP)
    // static const String _baseUrl = '[http://192.168.1.100:8000/api](http://192.168.1.100:8000/api)';
    ```

### Running the Application

1.  **Select a device:** In the bottom-right corner of VS Code, select your target device (e.g., **Chrome**, an **Android Emulator**, or a connected physical device).
2.  **Run the app:**
    -   Press `F5` to start a debugging session.
    -   Or run the following command in your terminal:
    ```bash
    flutter run
    ```

---

## ✅ Testing

The project is set up for testing. To run all the available tests (unit and widget tests), execute the following command:

```bash
flutter test
```
