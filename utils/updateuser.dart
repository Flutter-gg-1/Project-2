import 'dart:io';
import 'dart:convert';
import '../model/book.dart';
import '../model/user.dart';
import '../model/customer.dart';

updateUser(User user, {Book? book}) async {
  File file = File('data/users.json');
  String content = file.readAsStringSync();
  Map<String, dynamic> users = jsonDecode(content);


  if(user is Customer){
    if(book != null){
      for (var customer in (users['customer'])) {
        if(customer['id'] == user.id){
            (customer['books_bought']as List).add(book.displayBookBought(book));
          break;
        }
      }
    }else{
      (users['customer']as List).add(user.toJson());
    }
  }else{

  }
  

  String update = jsonEncode(users);
  file.writeAsStringSync(update, mode: FileMode.write);
}
