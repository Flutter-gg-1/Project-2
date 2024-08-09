import './library.dart';
import './customer.dart';
import '../global_variabels.dart';
import './purchase.dart';
import '../data/jsonData.dart';

class MyLibrary {
  static void displayBooks() {
    var books = Library.fromJson(jsonData);
    print("============================");
    print("   ID     |   Title");
    for (var element in books.book) {
      print('''

    ${element.id}     |    ${element.title}
''');
    }
  }

  static void addBook(Book book) {
    myBook.add(book);
    bookID++;
  }

  static void removeBook(String id) {
    String value = "";

    for (var element in myBook) {
      if (id == element.id) {
        myBook.remove(element);
        value =
            "Book ID :${element.id} => Name : ${element.title} Delete it successfully ";
        break;
      } else {
        value = "Sorry! we can't find book ID";
      }
    }
    print(value);
  }

  static void buyBook(String id, int quantity, Customer customer) {
    String value = "";
    for (var element in myBook) {
      if (id == element.id) {
        if (element.quantity >= quantity) {
          var customerPurchase = Purchase(
              pid: "P$purchaseID",
              createAt: DateTime.now(),
              customer: customer,
              amount: quantity * element.price,
              id: id,
              title: element.title,
              authors: element.authors,
              categories: element.categories,
              year: element.year,
              quantity: quantity,
              price: element.price);
          myPurchase.add(customerPurchase);
          element.quantity -= quantity;
          purchaseID++;
          value = "Purchase it complete it :)";

          break;
        } else {
          value = "Sorry! we don't have this quantity";
        }
      } else {
        value = "ID not founded!";
      }
    }
    print(value);
  }
}
