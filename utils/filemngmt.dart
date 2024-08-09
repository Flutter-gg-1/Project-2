import 'dart:io';
import 'dart:convert';
import '../model/admin.dart';
import '../model/book.dart';
import '../model/customer.dart';
import '../model/user.dart';

readFile(List<Book>? books, List<User> users) async {
  File file = File('data/data.json');
  String content = file.readAsStringSync();
  Map<String, dynamic> bookList = jsonDecode(content);

  for (var book in bookList['library']) {
    books?.add(Book.fromJson(book));
  }

  print('here 1');
  file = File('data/users.json');
  content = file.readAsStringSync();
  Map<String, dynamic> userList = jsonDecode(content);

  print('here 2');

  for (var admin in userList['admin']) {
    users.add(Admin.fromJson(admin));
  }
  print('here 3');

  for (var customer in userList['customer']) {
    users.add(Customer.fromJson(customer));
  }
}
