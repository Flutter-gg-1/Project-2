// Implement Operations : Remove a Book: Implement a function to remove books from the library.
import 'dart:io';
import '../core/all_file.dart';

void removeBook() {
  print('\nwhich book you want to Remove a book:\n');
  print(libraryJSONData['library']);
  print('\nEnter book id:');
  int bookId = int.parse(stdin.readLineSync()!);
  for (var element in libraryJSONData['library']) {
    if (element['id'] == bookId) {
      libraryJSONData['library'].remove(element);
      break;
    }
  }
  print('\n_____________________________');
  print(libraryJSONData['library']);

  print('\nBook removed successfully.\n');
  adminDashboard();
}
