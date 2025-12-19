# 🚀 Quick Reference Cheat Sheet

## 📱 Running the App

```bash
# Check Flutter setup
flutter doctor

# Get dependencies
flutter pub get

# Run on connected device
flutter run

# Run in release mode (faster)
flutter run --release

# Hot reload (press 'r' in terminal)
# Hot restart (press 'R' in terminal)

# Clean build
flutter clean && flutter pub get

# Build APK
flutter build apk
```

---

## 📝 Common Flutter Commands

```bash
# Create new Flutter project
flutter create project_name

# Add package
flutter pub add package_name

# Remove package
flutter pub remove package_name

# Update packages
flutter pub upgrade

# Analyze code
flutter analyze

# Format code
dart format lib/

# Run tests
flutter test
```

---

## 🎨 Useful Widgets Quick Reference

### Layout Widgets

```dart
// Vertical layout
Column(children: [...])

// Horizontal layout
Row(children: [...])

// Stack widgets on top of each other
Stack(children: [...])

// Scrollable column
ListView(children: [...])

// Padding
Padding(padding: EdgeInsets.all(16), child: ...)

// Centering
Center(child: ...)

// Sized box (spacing)
SizedBox(height: 16, width: 16)

// Flexible space
Expanded(child: ...)
Flexible(flex: 1, child: ...)
```

### Material Widgets

```dart
// Material page structure
Scaffold(
  appBar: AppBar(title: Text(...)),
  body: ...,
  floatingActionButton: FloatingActionButton(...),
  bottomNavigationBar: NavigationBar(...),
)

// Card
Card(child: ...)

// Button
ElevatedButton(onPressed: () {}, child: Text(...))
TextButton(onPressed: () {}, child: Text(...))
OutlinedButton(onPressed: () {}, child: Text(...))

// Icon button
IconButton(icon: Icon(Icons.home), onPressed: () {})

// Text input
TextField(controller: ..., decoration: InputDecoration(...))
TextFormField(validator: ..., decoration: InputDecoration(...))
```

### Display Widgets

```dart
// Text
Text('Hello', style: TextStyle(fontSize: 20))

// Icon
Icon(Icons.home, size: 24, color: Colors.blue)

// Image from network
Image.network('https://...')

// Image from assets
Image.asset('assets/image.png')

// Circular progress indicator
CircularProgressIndicator()

// Linear progress indicator
LinearProgressIndicator()

// Divider
Divider()
```

---

## 🎯 Common Patterns

### Navigation

```dart
// Navigate to new screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);

// Navigate with named route
Navigator.pushNamed(context, '/route-name');

// Go back
Navigator.pop(context);

// Replace current screen
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);
```

### State Management

```dart
// Update UI
setState(() {
  _counter++;
});

// Read state
final value = _counter;
```

### Form Validation

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Process data
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
```

### FutureBuilder

```dart
FutureBuilder<DataType>(
  future: fetchData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    if (snapshot.hasData) {
      return Text('Data: ${snapshot.data}');
    }
    return Text('No data');
  },
)
```

### ListView Builder

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index].title),
      onTap: () {
        // Handle tap
      },
    );
  },
)
```

---

## 🎨 Styling Quick Reference

### Colors

```dart
// Predefined colors
Colors.red
Colors.blue.shade700

// Custom color
Color(0xFF6366F1)  // AARRGGBB format
Color.fromRGBO(99, 102, 241, 1.0)
Color.fromARGB(255, 99, 102, 241)

// Opacity
Colors.red.withOpacity(0.5)
```

### Text Styles

```dart
TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
  letterSpacing: 1.2,
  height: 1.5,  // Line height
  decoration: TextDecoration.underline,
)
```

### Box Decoration

```dart
Container(
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.purple],
    ),
  ),
)
```

### Spacing

```dart
// Padding
EdgeInsets.all(16)                                    // All sides
EdgeInsets.symmetric(horizontal: 16, vertical: 8)     // H & V
EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 4) // Custom

// Margin (same syntax)
margin: EdgeInsets.all(16)
```

---

## 🔧 Debugging Tips

### Print Debugging

```dart
print('Value: $variable');
debugPrint('Debug message');
```

### Assert

```dart
assert(value != null, 'Value should not be null');
```

### Try-Catch

```dart
try {
  final data = await fetchData();
} catch (e) {
  print('Error: $e');
} finally {
  // Always runs
}
```

### DevTools

```bash
# Open Flutter DevTools
flutter run
# Then press 'w' in terminal
```

---

## 📦 This Project's File Map

```
Need colors?          → core/constants/app_colors.dart
Need text strings?    → core/constants/app_strings.dart
Need theme config?    → core/theme/app_theme.dart
Need API calls?       → shared/services/api_service.dart
Need data model?      → shared/models/post_model.dart
Need loading UI?      → shared/widgets/loading_view.dart
Need error UI?        → shared/widgets/error_view.dart
Need empty state?     → shared/widgets/empty_view.dart
Working on login?     → features/auth/
Working on home?      → features/home/
Working on profile?   → features/profile/
Need to add routes?   → main.dart
```

---

## 🐛 Common Errors & Fixes

### Error: "Null check operator used on a null value"

```dart
// Bad
final value = nullableValue!;  // Crashes if null

// Good
final value = nullableValue ?? defaultValue;
if (nullableValue != null) {
  final value = nullableValue;
}
```

### Error: "setState called after dispose"

```dart
// Fix: Check if mounted
if (mounted) {
  setState(() {
    // Update state
  });
}
```

### Error: "RenderFlex overflowed"

```dart
// Wrap in Expanded or Flexible
Column(
  children: [
    Expanded(  // Takes remaining space
      child: ListView(...),
    ),
  ],
)

// Or make scrollable
SingleChildScrollView(
  child: Column(...),
)
```

### Error: "MediaQuery not found"

```dart
// Wrap with MaterialApp first
MaterialApp(
  home: Scaffold(...),
)
```

---

## 🎓 Learning Path

### Beginner
1. ✅ Widgets (Column, Row, Container, Text)
2. ✅ Stateless vs Stateful
3. ✅ setState basics
4. ✅ Navigation
5. ✅ Form validation

### Intermediate
6. FutureBuilder & StreamBuilder
7. HTTP requests
8. JSON parsing
9. Error handling
10. Theming

### Advanced
11. State management (Provider, Riverpod, Bloc)
12. Animations
13. Custom painters
14. Platform channels
15. Performance optimization

---

## 📚 Essential Packages

```yaml
# HTTP
http: ^1.1.0

# State Management
provider: ^6.0.0
riverpod: ^2.0.0

# Local Storage
shared_preferences: ^2.0.0
hive: ^2.0.0

# Navigation
go_router: ^12.0.0

# UI
shimmer: ^3.0.0
cached_network_image: ^3.0.0
flutter_svg: ^2.0.0

# Utilities
intl: ^0.18.0  # Date/number formatting
uuid: ^4.0.0   # Generate unique IDs
```

---

## ⚡ Performance Tips

```dart
// Use const constructors when possible
const Text('Hello')  // Created once, reused

// Avoid rebuilding unnecessarily
const SizedBox(height: 16)  // Better than SizedBox(height: 16)

// Extract widgets
// Bad: widget tree in build() method
// Good: separate widget classes

// Use ListView.builder for long lists
// Instead of ListView(children: [...])

// Cache network images
CachedNetworkImage(imageUrl: url)
```

---

## 🔗 Quick Links

- [Flutter Docs](https://docs.flutter.dev)
- [Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [Pub.dev Packages](https://pub.dev)
- [Material Icons](https://fonts.google.com/icons)
- [Material 3 Design](https://m3.material.io)

---

**💡 Pro Tip: Keep this file open while coding!**
