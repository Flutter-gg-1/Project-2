import 'dart:io';
import 'book_inisialize.dart';
import 'start_admin.dart';

  void removeBook() {
  print("\nCurrent Library:");
  for (int i = 0; i < books.library.length; i++) {
    print("ID: ${books.library[i].id}, Title: ${books.library[i].title}");
  }
  print("\nEnter the ID of the book you want to remove:");
  String? bookIdToRemove = stdin.readLineSync();
  int? indexToRemove;
  for (int i = 0; i < books.library.length; i++) {
    if (books.library[i].id == bookIdToRemove) {
      indexToRemove = i;
      break;
    }
  }
  if (indexToRemove != null) {
    // Remove the book
    books.library.removeAt(indexToRemove);
    print("Book removed successfully!");    
    stdin.readLineSync();
    startAdmin();
  } else {
    print("Book with ID '$bookIdToRemove' not found.");
    stdin.readLineSync();
    startAdmin();
  }
  stdin.readLineSync();
}
