import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../shared/models/post_model.dart';
import '../../shared/services/api_service.dart';
import '../../shared/widgets/loading_view.dart';
import '../../shared/widgets/error_view.dart';
import '../../shared/widgets/empty_view.dart';
import 'widgets/post_card.dart';

/// Home screen
/// Displays a list of posts fetched from JSONPlaceholder API
/// Demonstrates FutureBuilder pattern with loading, error, and empty states
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // API service instance
  final ApiService _apiService = ApiService();
  
  // Future to fetch posts
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    // Fetch posts when screen loads
    _postsFuture = _apiService.fetchPosts();
  }

  /// Retry fetching posts
  /// Called when user taps the retry button in ErrorView
  void _retryFetch() {
    setState(() {
      _postsFuture = _apiService.fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homeTitle),
        actions: [
          // Refresh button
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: _retryFetch,
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          // Loading state - while data is being fetched
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingView();
          }

          // Error state - if fetch failed
          if (snapshot.hasError) {
            return ErrorView(
              message: snapshot.error.toString(),
              onRetry: _retryFetch,
            );
          }

          // Success state - data received
          if (snapshot.hasData) {
            final posts = snapshot.data!;

            // Empty state - no posts available
            if (posts.isEmpty) {
              return const EmptyView(
                message: AppStrings.homeEmptyMessage,
                subtitle: AppStrings.homeEmptySubtitle,
                icon: Icons.article_outlined,
              );
            }

            // Display posts list
            return RefreshIndicator(
              onRefresh: () async {
                _retryFetch();
                // Wait a bit for the future to start
                await Future.delayed(const Duration(milliseconds: 100));
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostCard(post: posts[index]);
                },
              ),
            );
          }

          // Fallback (shouldn't reach here)
          return const Center(
            child: Text('No data available'),
          );
        },
      ),
    );
  }
}
