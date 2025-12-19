import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';
import '../models/user_model.dart';

/// Service class for API calls
/// Keeps all HTTP logic in one place, making it easy to test and maintain
class ApiService {
  // Base URL for JSONPlaceholder API
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  /// Fetch all posts from the API
  /// Returns a list of Post objects
  /// Throws an exception if the request fails
  Future<List<Post>> fetchPosts() async {
    try {
      // Make GET request to /posts endpoint
      final response = await http.get(
        Uri.parse('$_baseUrl/posts'),
      );

      // Check if request was successful (status code 200)
      if (response.statusCode == 200) {
        // Decode JSON response body
        final List<dynamic> jsonList = json.decode(response.body);

        // Convert each JSON object to a Post object
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        // Request failed with non-200 status code
        throw Exception('Failed to load posts. Status: ${response.statusCode}');
      }
    } catch (e) {
      // Re-throw any errors (network issues, JSON parsing errors, etc.)
      throw Exception('Error fetching posts: $e');
    }
  }

  /// Fetch a single post by ID
  /// Returns a Post object
  /// Throws an exception if the request fails
  Future<Post> fetchPost(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/posts/$id'),
      );

      if (response.statusCode == 200) {
        return Post.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load post. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching post: $e');
    }
  }

  /// Fetch a single user by ID
  /// Returns a User object with real data from API
  Future<User> fetchUser(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/users/$id'),
      );

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load user. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
  }

  /// Fetch all users from the API
  /// Returns a list of User objects
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/users'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }

  /// Fetch posts by a specific user
  /// Returns a list of Post objects for the given userId
  Future<List<Post>> fetchPostsByUser(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/posts?userId=$userId'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load user posts. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching user posts: $e');
    }
  }
}
