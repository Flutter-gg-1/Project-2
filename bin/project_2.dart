import 'management.dart';
import 'user.dart';
import 'admin.dart';

void main() {
  // // display all data
  // Library library = Library.fromJson(libraryBook);
  // for (var book in library.books) {
  //   print(book.title);
  //   print(book.authors);
  //   print(book.categories);
  //   print(book.year);
  //   print(book.quantity);
  //   print(book.price);
  // }
  bool isExit = false;
  print("Welcome to the library");
  print("Happy to see you again !");

  Accounts accounts = Accounts();
  accounts.logIn();
  
}
