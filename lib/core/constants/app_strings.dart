/// Centralized string constants for the app
/// Keeping strings in one place makes it easier to:
/// - Update copy across the app
/// - Add multi-language support later
/// - Maintain consistency
class AppStrings {
  // Private constructor to prevent instantiation
  AppStrings._();

  // App-wide
  static const String appName = 'Mobile UI Modules';

  // Login Screen
  static const String loginTitle = 'Welcome Back';
  static const String loginSubtitle = 'Sign in to continue';
  static const String emailLabel = 'Email';
  static const String emailHint = 'Enter your email';
  static const String passwordLabel = 'Password';
  static const String passwordHint = 'Enter your password';
  static const String loginButton = 'Login';
  static const String forgotPassword = 'Forgot Password?';

  // Validation messages
  static const String emailRequired = 'Please enter your email';
  static const String emailInvalid = 'Please enter a valid email';
  static const String passwordRequired = 'Please enter your password';
  static const String passwordTooShort = 'Password must be at least 6 characters';

  // Home Screen
  static const String homeTitle = 'Posts';
  static const String homeEmptyMessage = 'No posts available';
  static const String homeEmptySubtitle = 'Check back later for new content';

  // Profile Screen
  static const String profileTitle = 'Profile';
  static const String profileName = 'John Doe';
  static const String profileBio = 'Flutter Developer | UI/UX Enthusiast';
  static const String profileEmail = 'john.doe@example.com';
  static const String profilePosts = 'Posts';
  static const String profileFollowers = 'Followers';
  static const String profileFollowing = 'Following';
  static const String editProfile = 'Edit Profile';
  static const String shareProfile = 'Share Profile';

  // Navigation
  static const String navHome = 'Home';
  static const String navProfile = 'Profile';

  // Error messages
  static const String errorTitle = 'Oops!';
  static const String errorGeneric = 'Something went wrong';
  static const String errorNetwork = 'Please check your internet connection';
  static const String retryButton = 'Try Again';

  // Loading
  static const String loading = 'Loading...';
}
