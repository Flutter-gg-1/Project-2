import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<String> login({bool? isAdmin}) async {
  File file = File('../data/users.json');
  String content = file.readAsStringSync();
  Map<String, dynamic> members = jsonDecode(content);

  print('\nEnter your Login information\n');
  stdout.write('ID: ');
  String id = stdin.readLineSync()!;
  stdout.write('password: ');
  String password = stdin.readLineSync()!;
  String hash = sha256.convert(utf8.encode(password)).toString();

  bool isSuccessful = false;
  if (isAdmin != null) {
    for (var member in members['admin']) {
      if (member['id'] == id && member['password'] == hash) {
        isSuccessful = true;
        break;
      }
    }
  } else {
    for (var member in members['customer']) {
      if (member['id'] == id && member['password'] == hash) {
        isSuccessful = true;
        break;
      }
    }
  }
  if (isSuccessful) {
    return id;
  } else {
    print('Login failed');
    return '0';
  }
}
