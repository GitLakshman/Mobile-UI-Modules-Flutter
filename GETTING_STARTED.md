# 🚀 Getting Started Guide

## Welcome to Mobile UI Modules!

This guide will help you get the project running on your machine.

---

## 📋 Prerequisites

Before you begin, make sure you have:

1. **Flutter SDK** installed (version 3.0.0+)
2. **Dart SDK** (comes with Flutter)
3. **Android Studio** or **VS Code** with Flutter extensions
4. **Android Emulator** or **iOS Simulator** (or physical device)

---

## ⚙️ Installation Steps

### Step 1: Install Flutter

If you don't have Flutter installed:

```bash
# Ubuntu/Linux
sudo snap install flutter --classic

# macOS
brew install flutter

# Windows
# Download from: https://docs.flutter.dev/get-started/install/windows

# Verify installation
flutter doctor
```

### Step 2: Clone & Setup Project

```bash
# Navigate to the project directory
cd /home/lakshman_prasad/PROJECTS/Mobile-UI-Modules-Flutter

# Get all dependencies
flutter pub get
```

**Expected Output:**
```
Running "flutter pub get" in Mobile-UI-Modules-Flutter...
Resolving dependencies... 
✓ Got dependencies!
```

### Step 3: Verify Setup

```bash
# Check for any issues
flutter doctor -v
```

Fix any issues marked with ❌ before proceeding.

### Step 4: Connect a Device

**Option A: Android Emulator**
```bash
# List available emulators
flutter emulators

# Launch an emulator
flutter emulators --launch <emulator_id>
```

**Option B: Physical Device**
- Enable Developer Options on your phone
- Enable USB Debugging
- Connect via USB
- Verify with: `flutter devices`

**Option C: iOS Simulator (macOS only)**
```bash
open -a Simulator
```

### Step 5: Run the App!

```bash
# Run in debug mode (hot reload enabled)
flutter run

# Or run in release mode (faster, no debugging)
flutter run --release
```

**First run may take 2-5 minutes** as Flutter builds everything.

---

## 🎮 Using the App

### Login Screen
1. Enter any email (e.g., `test@example.com`)
2. Enter password (min 6 characters, e.g., `password123`)
3. Tap **Login**

### Home Screen
- View posts loaded from JSONPlaceholder API
- Pull down to refresh
- Tap any post to read full content
- Tap refresh icon in app bar

### Profile Screen
- View static profile with gradient header
- Explore menu items
- Tap **Logout** to return to login

### Theme Toggle
- Tap the **floating action button** (moon/sun icon) to switch between light and dark mode

---

## 🔧 Development Workflow

### Hot Reload (While App is Running)

```bash
# Press 'r' in terminal for hot reload (fast, preserves state)
# Press 'R' for hot restart (slower, resets state)
# Press 'p' for widget inspector overlay
# Press 'o' for iOS/Android toggle
# Press 'q' to quit
```

### Making Changes

1. **Edit any file in `lib/`**
2. **Save the file**
3. **Press `r` in terminal**
4. Changes appear instantly! ⚡

### Code Quality

```bash
# Check for issues
flutter analyze

# Format code
dart format lib/

# Run tests (when you add them)
flutter test
```

---

## 📁 Project Structure Quick Reference

```
lib/
├── core/               👉 App-wide configuration
│   ├── constants/      👉 Colors, strings
│   └── theme/          👉 Light/dark themes
│
├── features/           👉 App screens
│   ├── auth/           👉 Login screen
│   ├── home/           👉 Posts list
│   └── profile/        👉 User profile
│
├── shared/             👉 Reusable components
│   ├── models/         👉 Data structures
│   ├── services/       👉 API calls
│   └── widgets/        �� UI components
│
└── main.dart           👉 App entry point
```

---

## 🐛 Troubleshooting

### Problem: `flutter: command not found`

**Solution:**
```bash
# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Or reinstall Flutter
sudo snap install flutter --classic
```

### Problem: `Gradle build failed`

**Solution:**
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

### Problem: `Version solving failed`

**Solution:**
```bash
# Update dependencies
flutter pub upgrade

# Or reset
rm pubspec.lock
flutter pub get
```

### Problem: Emulator not showing

**Solution:**
```bash
# Check connected devices
flutter devices

# If no devices, launch emulator from Android Studio
# Or: flutter emulators --launch <name>
```

### Problem: Hot reload not working

**Solution:**
- Use `R` (capital R) for full restart
- Stop app and run again
- Restart IDE

---

## 📚 Next Steps

### For Learning
1. Read **BEGINNERS_GUIDE.md** - Understand every file
2. Read **ARCHITECTURE.md** - See how it all connects
3. Read **CHEAT_SHEET.md** - Quick Flutter reference

### For Building
1. Check **TODO.md** - Pick a feature to add
2. Make changes in `lib/`
3. Test with hot reload
4. Commit to Git

### For Understanding
```bash
# Explore the code
code lib/main.dart                    # Start here
code lib/features/home/home_screen.dart  # See API integration
code lib/shared/widgets/loading_view.dart # See shimmer effect
```

---

## 🎯 Common Tasks

### Add a New Package

```bash
# Add package
flutter pub add package_name

# Example: Add shared_preferences
flutter pub add shared_preferences
```

### Create a New Screen

```bash
# Create file
touch lib/features/settings/settings_screen.dart

# Add to routes in main.dart
'/settings': (context) => SettingsScreen(),
```

### Change App Name

Edit `pubspec.yaml`:
```yaml
name: my_custom_name
```

Then:
```bash
flutter clean
flutter pub get
```

---

## 🔗 Useful Commands Reference

```bash
# Update Flutter
flutter upgrade

# List connected devices
flutter devices

# Build APK (Android)
flutter build apk --release

# Build iOS (macOS only)
flutter build ios --release

# Clean build files
flutter clean

# Check dependencies
flutter pub outdated

# See app size
flutter build apk --analyze-size
```

---

## 📞 Need Help?

- 📖 **Official Docs**: https://docs.flutter.dev
- 💬 **Discord**: https://discord.gg/flutter
- 🔍 **Stack Overflow**: Tag `flutter`
- 📺 **YouTube**: Search "Flutter tutorial"

---

## ✅ Checklist

Before starting development:

- [ ] Flutter installed (`flutter doctor` passes)
- [ ] Project dependencies fetched (`flutter pub get`)
- [ ] Device connected (`flutter devices` shows device)
- [ ] App runs successfully (`flutter run`)
- [ ] Hot reload works (press `r` while running)
- [ ] Code analyzer passes (`flutter analyze`)

---

## 🎉 You're All Set!

The app should now be running on your device/emulator.

**Next:** Start exploring the code and making your first changes!

**Tip:** Keep the terminal window open while developing for hot reload.

---

**Happy Coding! 🚀**
