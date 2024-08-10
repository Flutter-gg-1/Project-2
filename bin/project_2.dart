import 'package:project_2/database/model/model.dart';
import 'package:project_2/database/json/library.dart';
import 'mangment.dart';
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
  AdminPermissions adminPermissions = AdminPermissions();
  UserPermissions userPermissions = UserPermissions();
  accounts.logIn();
  do {
    switch (userPermissions.userInput()) {
      case 1:
        adminPermissions.addBook();
        break;
      case 2:
        adminPermissions.removeBook();
        break;
      case 3:
        adminPermissions.updateBook();
        break;
      case 4:
        adminPermissions.viewReceipt();
        break;
      case 5:
        adminPermissions.viewBooks();
        break;
      case 6:
        accounts.signOut();
        isExit = true;
        break;
      default:
        print("Invalid option");
    }
  } while (!isExit);

  do {
    switch (userPermissions.userInput()) {
      case 01:
        userPermissions.viewBooks();
        break;
      case 02:
        userPermissions.purchaseBook();
        break;
      case 03:
        userPermissions.viewReceipt();
        break;
      case 04:
        userPermissions.viewPurchasedBooks();
        break;
      case 05:
        accounts.signOut();
        isExit = true;
        break;
      default:
        print("Invalid option");
    }
  } while (!isExit);
}
