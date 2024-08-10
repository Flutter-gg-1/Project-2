// Implement Operations : Remove a Book: Implement a function to remove books from the library.
import 'dart:io';
import '../core/all_file.dart';

void removeBook() {
  if (libraryJSONData['library'].length == 0) {
    print('Library is empty.');
    adminDashboard();
  } else {
      print('\nwhich book you want to Remove a book:\n');
  print(libraryJSONData['library']);
  print('\nEnter book id:');
  int bookId = int.parse(stdin.readLineSync()!);
  for (var element in libraryJSONData['library']) {
    String bookIdChecked = bookId.toString();
    if (element['id'] == bookIdChecked &&
        libraryJSONData['library'].length > 0) {
      libraryJSONData['library'].remove(element);
      print('\n_____________________________\n');
      print('Book Id was $bookId\n');
      print(libraryJSONData['library']);
      print('\nBook removed successfully.\n');
      break;
    } else {
      print('Book not found.\n');
    }
  }

  adminDashboard();
  }
}
