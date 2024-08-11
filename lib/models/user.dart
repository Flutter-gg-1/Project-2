import 'dart:convert';
import 'package:crypto/crypto.dart'; // We'll use this for hashing.

class User {
  final String id;
  final String username;
  final String hashedPassword;

  User({
    required this.id,
    required this.username,
    required this.hashedPassword,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      hashedPassword: json['hashedPassword'] as String,
    );
  }

  // Method to convert User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'hashedPassword': hashedPassword,
    };
  }

  // Hash a password using SHA-256 (a simple hash function)
  static String hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to bytes
    final digest = sha256.convert(bytes); // Hash using SHA-256
    return digest.toString(); // Convert to a hexadecimal string
  }

  // Verify if a plain password matches the hashed password
  bool verifyPassword(String password) {
    return hashPassword(password) == hashedPassword;
  }
}
