import 'model/library.dart';
import './data/jsonData.dart';
import './data/userData.dart';
import 'global/global_variabels.dart';
import 'model/customer.dart';

startApp() {
  var x1 = Customers.fromJson(userData);
  for (var element in x1.customer) {
    customer.add(element);
  }

  var x2 = Library.fromJson(jsonData);
  for (var element in x2.book) {
    myBook.add(element);
  }
}
