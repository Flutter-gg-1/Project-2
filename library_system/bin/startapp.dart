import 'model/library.dart';
import './data/jsonData.dart';
import './data/userData.dart';
import './global_variabels.dart';
import 'model/customer.dart';

startApp() {
  // var admin = Customer(
  //     id: 1001,
  //     name: "Ali",
  //     phone: "0597555447",
  //     username: "someone_14",
  //     password: "123");

  // var customer1 = Customer(
  //     id: 1002,
  //     name: "Sami",
  //     phone: "0597555448",
  //     username: "something",
  //     password: "123");

  // customer.add(admin);
  // customer.add(customer1);
  var x1 = Customers.fromJson(userData);
  for (var element in x1.customer) {
    customer.add(element);
    print(element.username);
  }
  print(customer);

  var x2 = Library.fromJson(jsonData);
  print(x2.book.first.id);
  for (var element in x2.book) {
    myBook.add(element);
  }
}
