import '../models/user.dart';
import '../models/user_manager.dart';

class Auth {
  final UserManager _userManager;

  Auth(this._userManager);

  // Register a new user
  bool register(String username, String password) {
    // Check if the username already exists
    final existingUser = _userManager.authenticate(username, password);
    if (existingUser != null) {
      print('Username already exists.');
      return false; // Registration failed due to existing user
    }

    // Add the new user
    _userManager.addUser(username, password);
    print('User registered successfully.');
    return true; // Registration successful
  }

  // Login a user
  User? login(String username, String password) {
    final user = _userManager.authenticate(username, password);
    if (user != null) {
      print('Login successful for user: ${user.username}');
      return user;
    } else {
      print('Login failed. Invalid username or password.');
      return null;
    }
  }

  // Log out the user (if you want to handle sessions or tokens)
  void logout(User user) {
    // Implement session or token invalidation logic here if needed
    print('User ${user.username} logged out successfully.');
  }
}
