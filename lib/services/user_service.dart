import 'dart:convert';
import '../models/user.dart';
import '../utils/json_manager.dart';

class UserService {
  List<User> _users = [];

  UserService() {
    _loadUsers();
  }

  // Load users from JSON file
  void _loadUsers() {
    final jsonData = JsonManager.readJson('data/users.json');
    _users = (jsonDecode(jsonData) as List)
        .map((userJson) => User.fromJson(userJson))
        .toList();
  }

  // Save the updated list of users back to JSON file
  void _saveUsers() {
    final jsonData = jsonEncode(_users.map((user) => user.toJson()).toList());
    JsonManager.writeJson('data/users.json', jsonData);
  }

// TODO Register a new user
// void registerUser(String name, String role, String password) {
//   final user = User(name: name, role: role, password: password);
//   _users.add(user);
//   _saveUsers();
// }

// // TODO Login a user by validating their password
// User? login(String name, String password) {
//   final user =
//       _users.firstWhere((user) => user.name == name, orElse: () => null);
//   if (user != null && user.validatePassword(password)) {
//     return user;
//   }
//   return null;
// }

// // Check if a user with the given name already exists
// bool userExists(String name) {
//   return _users.any((user) => user.name == name);
// }
}
