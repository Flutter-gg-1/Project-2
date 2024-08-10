import 'dart:io';
import 'dart:convert';
import '../model/book.dart';
import '../model/user/customer.dart';
import '../model/user/user.dart';

updateUser(User user, {Book? book}) async {
  File file = File('data/users.json');
  String content = file.readAsStringSync();
  Map<String, dynamic> users = jsonDecode(content);

  if (book != null) {
    for (var customer in users['customer']) {
      if (customer['id'] == user.id) {
        (customer['books_bought'] as List).add(book.displayBookBought(book));
        for (var object in User.usersList) {
          if (object.id == customer['id']) {
            (object as Customer).purchaseHistory.add(book);
            break;
          }
        }
        break;
      }
    }
  } else {
    (users['customer'] as List).add(user.toJson());
  }

  String update = jsonEncode(users);
  file.writeAsStringSync(update, mode: FileMode.write);
}
