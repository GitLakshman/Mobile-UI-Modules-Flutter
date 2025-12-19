# 📱 Mobile UI Modules - Flutter

A beginner-to-intermediate Flutter project showcasing **pixel-perfect UI**, **reusable widgets**, **responsive layouts**, and **REST API integration** with proper loading & error handling.

> **Perfect for:** Intern-level portfolios, learning Flutter best practices, and understanding clean code architecture.

---

## ✨ Features

### 🔐 Authentication
- **Login Screen** with form validation
- Email & password validation with visual feedback
- Password visibility toggle
- Loading state during authentication

### 🏠 Home Dashboard
- **API-driven post list** from JSONPlaceholder
- **Shimmer loading effect** for better UX
- **Error handling** with retry button
- **Empty state** for no data
- **Pull-to-refresh** functionality
- Tap to view full post details

### 👤 Profile Screen
- Clean profile UI with gradient header
- User stats (Posts, Followers, Following)
- Action buttons (Edit Profile, Share)
- Menu items for app navigation
- Logout functionality

### 🎨 Theme Support
- **Light & Dark mode** toggle
- Material 3 design system
- Custom color palette
- Consistent styling across app

---

## 📁 Folder Structure

```
lib/
├── core/                       # Core app configuration
│   ├── theme/
│   │   └── app_theme.dart     # Light & Dark theme
│   └── constants/
│       ├── app_colors.dart    # Color palette
│       └── app_strings.dart   # UI strings
│
├── features/                   # Feature modules
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── widgets/
│   │       └── login_form.dart
│   │
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── widgets/
│   │       └── post_card.dart
│   │
│   └── profile/
│       └── profile_screen.dart
│
├── shared/                     # Shared components
│   ├── widgets/
│   │   ├── loading_view.dart  # Shimmer skeleton
│   │   ├── error_view.dart    # Error + retry
│   │   └── empty_view.dart    # Empty state
│   │
│   ├── services/
│   │   └── api_service.dart   # HTTP client
│   │
│   └── models/
│       └── post_model.dart    # Data models
│
└── main.dart                   # App entry point
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or iOS Simulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/GitLakshman/Mobile-UI-Modules-Flutter.git
   cd Mobile-UI-Modules-Flutter
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0        # REST API calls
  shimmer: ^3.0.0     # Loading skeleton effect

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

---

## 🎓 Learning Points

### For Beginners

1. **Clean Architecture**
   - Separation of concerns (Core, Features, Shared)
   - Reusable widgets and components
   - Centralized theme and constants

2. **State Management**
   - Using `setState` for local state
   - `FutureBuilder` for async operations
   - No complex state management libraries

3. **API Integration**
   - HTTP requests with `http` package
   - JSON parsing with factory constructors
   - Error handling and retry logic

4. **UI/UX Best Practices**
   - Loading states (shimmer effect)
   - Error states (with retry)
   - Empty states (friendly messages)
   - Material 3 design guidelines

5. **Form Validation**
   - Email regex validation
   - Password strength checks
   - Visual error feedback

---

## 🔧 How to Use

### Login Screen
1. Enter any valid email (e.g., `test@example.com`)
2. Enter password (minimum 6 characters)
3. Tap "Login" button

### Home Screen
1. View posts fetched from API
2. Pull down to refresh
3. Tap any post to view full details
4. Tap refresh icon in app bar

### Profile Screen
1. View user profile and stats
2. Explore menu items
3. Tap logout to return to login

### Theme Toggle
- Tap the floating action button (moon/sun icon) to switch themes

---

## 🧪 Testing

Run Flutter analyzer to check code quality:
```bash
flutter analyze
```

Run tests (if any):
```bash
flutter test
```

---

## 📝 Code Quality

- ✅ Following Flutter best practices
- ✅ Clean, readable, and well-commented code
- ✅ Consistent naming conventions
- ✅ Reusable widget architecture
- ✅ Proper error handling
- ✅ Material 3 design system

---

## 🤝 Contributing

This is a learning project. Feel free to:
- Fork the repository
- Create feature branches
- Submit pull requests
- Report issues

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Lakshman Prasad**
- GitHub: [@GitLakshman](https://github.com/GitLakshman)

---

## 🙏 Acknowledgments

- [JSONPlaceholder](https://jsonplaceholder.typicode.com/) for the free API
- Flutter team for amazing documentation
- Material Design team for design guidelines

---

## 📸 Screenshots

> **Note:** Add screenshots here once you run the app:
> - Login Screen (Light & Dark)
> - Home Screen with posts
> - Profile Screen
> - Loading/Error states

---

**⭐ If you found this helpful, please star the repository!**
