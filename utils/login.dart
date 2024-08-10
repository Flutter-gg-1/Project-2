import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../model/user/user.dart';
import '../model/user/admin.dart';
import '../model/user/customer.dart';

Future<User?> login({bool? isAdmin}) async {
  File file = File('data/users.json');
  String content = file.readAsStringSync();
  Map<String, dynamic> members = jsonDecode(content);

  print('\nEnter your Login information');
  stdout.write('ID: ');
  String id = stdin.readLineSync()!;
  stdout.write('password: ');
  String password = stdin.readLineSync()!;
  String hash = sha256.convert(utf8.encode(password)).toString();

  User? user;

  for (var member in members['admin']) {
    if (member['id'] == id && member['password'] == hash) {
      user = Admin.fromJson(member);
      print('--- Welcome ${user.firstName} ---');
      return user;
    }
  }

  for (var member in members['customer']) {
    if (member['id'] == id && member['password'] == hash) {
      user = Customer.fromJson(member);
      print('--- Welcome ${user.firstName} ---');
      return user;
    }
  }
  return null;
}
