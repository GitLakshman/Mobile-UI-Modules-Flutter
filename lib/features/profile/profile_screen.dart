import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';
import '../../shared/models/user_model.dart';
import '../../shared/services/api_service.dart';
import '../../shared/widgets/loading_view.dart';
import '../../shared/widgets/error_view.dart';

/// Profile screen
/// Fetches real user data from JSONPlaceholder API
/// Shows profile info, stats, and action buttons
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService _apiService = ApiService();
  late Future<User> _userFuture;
  late Future<int> _postCountFuture;

  @override
  void initState() {
    super.initState();
    // Fetch user with ID 1 (Leanne Graham from JSONPlaceholder)
    _userFuture = _apiService.fetchUser(1);
    _postCountFuture =
        _apiService.fetchPostsByUser(1).then((posts) => posts.length);
  }

  void _retryFetch() {
    setState(() {
      _userFuture = _apiService.fetchUser(1);
      _postCountFuture =
          _apiService.fetchPostsByUser(1).then((posts) => posts.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.profileTitle),
        actions: [
          // Refresh button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _retryFetch,
          ),
          // Settings button
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings coming soon!')),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingView();
          }

          if (snapshot.hasError) {
            return ErrorView(
              message: snapshot.error.toString(),
              onRetry: _retryFetch,
            );
          }

          if (snapshot.hasData) {
            final user = snapshot.data!;
            return _buildProfileContent(context, user);
          }

          return const Center(child: Text('No data available'));
        },
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, User user) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header section with gradient background
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),

                // Profile avatar with user initial
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.surfaceLight,
                    child: Text(
                      user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Real Name from API
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),

                // Username
                Text(
                  '@${user.username}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),

                // Company catchphrase as bio
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    '"${user.company.catchPhrase}"',
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),

                // Email
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 16,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      user.email.toLowerCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Website
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.language,
                      size: 16,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      user.website,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${user.address.city}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Stats section with real post count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: FutureBuilder<int>(
              future: _postCountFuture,
              builder: (context, postSnapshot) {
                final postCount = postSnapshot.data?.toString() ?? '...';
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StatItem(
                      label: AppStrings.profilePosts,
                      value: postCount,
                      icon: Icons.article_outlined,
                    ),
                    const _StatItem(
                      label: AppStrings.profileFollowers,
                      value: '1.2K',
                      icon: Icons.people_outline,
                    ),
                    const _StatItem(
                      label: AppStrings.profileFollowing,
                      value: '345',
                      icon: Icons.person_add_outlined,
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Company info card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.business,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Works at',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.company.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.company.bs,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Contact info card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _ContactRow(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: user.phone,
                    ),
                    const SizedBox(height: 12),
                    _ContactRow(
                      icon: Icons.location_on,
                      label: 'Address',
                      value: user.address.fullAddress,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Edit profile feature coming soon!')),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text(AppStrings.editProfile),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Share profile feature coming soon!')),
                    );
                  },
                  icon: const Icon(Icons.share),
                  label: const Text(AppStrings.shareProfile),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Menu items
          _MenuItem(
            icon: Icons.bookmark_outline,
            title: 'Saved Posts',
            onTap: () {},
          ),
          _MenuItem(
            icon: Icons.history,
            title: 'Activity',
            onTap: () {},
          ),
          _MenuItem(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),
          _MenuItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          _MenuItem(
            icon: Icons.logout,
            title: 'Logout',
            textColor: AppColors.error,
            onTap: () {
              // Navigate back to login
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Contact row widget for displaying contact info
class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Stat item widget for displaying profile statistics
class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}

/// Menu item widget for profile actions
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: textColor ?? Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: textColor ?? Theme.of(context).iconTheme.color,
      ),
      onTap: onTap,
    );
  }
}
