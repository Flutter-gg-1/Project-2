import 'dart:convert';
import 'package:uuid/uuid.dart';
import '../utils/json_manager.dart';
import 'user.dart';

class UserManager {
  final List<User> _users = [];
  final Uuid _uuid = Uuid();

  UserManager() {
    _loadUsers();
  }

  // Load users from a JSON file.
  void _loadUsers() {
    final jsonData = JsonManager.readJson('data/users.json');
    if (jsonData.isNotEmpty) {
      final List<dynamic> usersJson = jsonDecode(jsonData);
      for (var userJson in usersJson) {
        _users.add(User.fromJson(userJson));
      }
    }
  }

  // Save the updated list of users back to the JSON file.
  void _saveUsers() {
    final jsonData = jsonEncode(_users.map((user) => user.toJson()).toList());
    JsonManager.writeJson('data/users.json', jsonData);
  }

  // Add a new user to the system.
  void addUser(String username, String password) {
    final hashedPassword = User.hashPassword(password);
    final newUser = User(
      id: _uuid.v4(),
      username: username,
      hashedPassword: hashedPassword,
    );
    _users.add(newUser);
    _saveUsers();
  }

  // Authenticate a user by username and password.
  User? authenticate(String username, String password) {
    for (var user in _users) {
      if (user.username == username && user.verifyPassword(password)) {
        return user;
      }
    }
    return null;
  }

  // List all users (for administrative purposes)
  List<User> listUsers() {
    return _users;
  }
}
