import 'dart:io';
import 'dart:convert';
import '../model/book.dart';

readFile(List<Book>? books) {
  File file = File('data/data.json');
  String content = file.readAsStringSync();
  Map<String,dynamic> bookList = jsonDecode(content);

  for (var i = 0; i < bookList.length; i++) {
    books?.add(Book.fromJson(bookList['library'][i]));
  }
}