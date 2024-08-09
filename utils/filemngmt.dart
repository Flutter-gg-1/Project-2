import 'dart:io';
import 'dart:convert';
import '../model/book.dart';

readFile(List<Book>? books) async{
  File file = File('data/data.json');
  String content = file.readAsStringSync();
  Map<String,dynamic> bookList = jsonDecode(content);

   for (var book in bookList['library']) {
    books?.add(Book.fromJson(book));
  }
}