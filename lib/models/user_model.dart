





import 'package:pro2/models/book_model.dart';

class UserModel{


  String userName;
  String passWord;
  bool isAdmin;

  List<BookModel> bookBuy = [];



  UserModel({
    required this.userName,
    required this.passWord,
    required this.isAdmin
  });

}