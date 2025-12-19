import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_strings.dart';
import 'features/auth/login_screen.dart';
import 'features/home/home_screen.dart';
import 'features/profile/profile_screen.dart';

/// Main entry point of the app
void main() {
  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Track current theme mode
  ThemeMode _themeMode = ThemeMode.light;

  /// Toggle between light and dark theme
  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light 
          ? ThemeMode.dark 
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      
      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      
      // Initial route
      initialRoute: '/',
      
      // Route configuration
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => MainNavigation(onThemeToggle: _toggleTheme),
      },
    );
  }
}

/// Main navigation widget with bottom navigation bar
/// Handles navigation between Home and Profile screens
class MainNavigation extends StatefulWidget {
  final VoidCallback onThemeToggle;

  const MainNavigation({
    super.key,
    required this.onThemeToggle,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Track current selected tab
  int _currentIndex = 0;

  // List of screens
  final List<Widget> _screens = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      
      // Bottom navigation bar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: AppStrings.navHome,
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: AppStrings.navProfile,
          ),
        ],
      ),
      
      // Floating action button for theme toggle
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onThemeToggle,
        tooltip: 'Toggle Theme',
        child: Icon(
          Theme.of(context).brightness == Brightness.light
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined,
        ),
      ),
    );
  }
}
