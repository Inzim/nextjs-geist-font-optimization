# E-Filing System - Flutter App

A comprehensive document management system built with Flutter for Android devices, based on the E-Filing application screenshots provided.

## Features

- **User Authentication**: Secure login system with role-based access
- **File Management**: Create, view, and manage documents
- **Rich Text Editor**: Full-featured content editor for file creation
- **Document Tracking**: Track file status and workflow
- **User Profile**: Manage user information and change password
- **Responsive Design**: Optimized for Android devices

## Screens

1. **Login Screen**: Secure authentication with username/password
2. **Dashboard**: Main navigation with sidebar menu
3. **Create New File**: Form for creating new documents
4. **My Files**: View and manage your created files
5. **Pending Files**: Review files awaiting approval
6. **Files Action Required**: Files that need your attention
7. **Change Password**: Update your account password

## Technical Stack

- **Flutter**: Cross-platform mobile development framework
- **Provider**: State management
- **Shared Preferences**: Local data storage
- **Flutter Quill**: Rich text editor
- **Material Design**: Modern UI components

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Android Studio / VS Code
- Android SDK

### Installation

1. Clone the repository
2. Navigate to the project directory:
   ```bash
   cd e_filing_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

### Build for Android

To build a release APK:
```bash
flutter build apk --release
```

To build an app bundle:
```bash
flutter build appbundle
```

## Project Structure

```
e_filing_app/
├── android/                 # Android-specific files
├── lib/
│   ├── main.dart           # App entry point
│   ├── providers/          # State management
│   ├── screens/            # UI screens
│   ├── utils/              # Utilities and themes
│   └── models/             # Data models
├── pubspec.yaml            # Dependencies
└── README.md              # This file
```

## Mock Data

The app includes mock data for demonstration purposes:
- User: Imran Zarkoon (Secretary Finance)
- Sample files with various statuses
- File types: PUC, Memo, Letter, Report, Application

## Future Enhancements

- Real API integration
- File attachments
- Push notifications
- Offline support
- Multi-language support
- Advanced search and filtering

## License

This project is created for demonstration purposes based on the provided E-Filing system screenshots.
