import 'dart:io';
import 'dart:convert';
import '../model/library.dart';
import '../model/book.dart';

updateData(Library lib, Book book, int choice, bool isExistent) async {
  File file = File('data/data.json');
  String content = file.readAsStringSync();
  Map<String, dynamic> books = jsonDecode(content);

  switch (choice) {
    case 1:
      if (isExistent) {
        for (var element in (books['library'])) {
          if (element['id'] == book.id) {
            element['quantity']++;
          }
        }
      } else {
        (books['library'] as List).add(book.toJson());
      }
    case 2:
      if (isExistent) {
        for (var element in (books['library'])) {
          if (element['id'] == book.id) {
            element['quantity']--;
          }
        }
      } else {
        (books['library'] as List)
            .removeWhere((element) => element['id'] == book.id);
      }
    default:
  }

  String update = jsonEncode(books);
  file.writeAsStringSync(update, mode: FileMode.write);
}
