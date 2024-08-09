import 'dart:math';

import 'model/library.dart';
import './data/jsonData.dart';
import './data/userData.dart';

import './global_variabels.dart';
import 'model/my_library.dart';
import 'model/customer.dart';
import './dashboards/user_dashboard.dart';
import 'startapp.dart';

void main() {
  // var x = Library.fromJson(jsonData);
  // var book1 = Book(
  //     id: "6",
  //     title: "Dart Book",
  //     authors: ['Ali', 'Fahad'],
  //     categories: ['programming'],
  //     year: 2024,
  //     quantity: 10,
  //     price: 50);
  // var customer = Customer(id: "C1001", name: "Ali", phone: "059");
  // for (var element in x.book) {
  //   myBook.add(element);
  // }

  // MyLibrary.addBook(book1);
  // for (var element in myBook) {
  //   print(element.quantity);
  // }

  // MyLibrary.buyBook("6", 9, customer);

  // for (var element in myBook) {
  //   print(element.quantity);
  // }

  // MyLibrary.removeBook("99");
  // for (var element in myBook) {
  //   print(element.id);
  // }

  startApp();
  do {
    userDashboard();
  } while (!isExitMainPage);
}
