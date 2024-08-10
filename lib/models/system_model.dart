import 'dart:io';

import 'package:pro2/models/book_model.dart';
import 'package:pro2/models/user_model.dart';

class SystemModel {
  List<BookModel> library = [];

  static int lastBookId = 0;

  // this List have UserModel and in it have the first admin that can add new Admin in the system
  List<UserModel> usermModelLis = [
    UserModel(userName: "admin", passWord: "1234", isAdmin: true)
  ];

  late UserModel user;

  SystemModel({required this.library}) {
    user = usermModelLis[0];
  }

  factory SystemModel.fromJson(Map<String, dynamic> json) {
    List<BookModel> lis = [];

    for (var val in json["library"]) {
      lis.add(BookModel.fromJson(val));
    }

    // check what the last book id that has been add in the system so we save it in order so it been automatic

    lastBookId = int.parse(lis.last.id);

    return SystemModel(library: lis);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> tempMap = [];

    for (var val in library) {
      tempMap.add(val.toJson());
    }

    return {"library": tempMap};
  }

  void addBook(
      {required String title,
      required List<String> authors,
      required List<String> categories,
      required int year,
      required int quantity,
      required double price}) {
    library.add(BookModel(
        authors: authors,
        categories: categories,
        id: (lastBookId + 1).toString(),
        price: price,
        quantity: quantity,
        title: title,
        year: year));
    print("\n#####    Book has been add!    #####\n");
    print(library.last.toJson());
  }

  void removeBook({required String serch, required bool idNot}) {
    if (idNot) {
      for (int i = 0; i < library.length; i++) {
        if (library[i].title == serch) {
          library.removeAt(i);
          print("\n#####    Book has been del!    #####\n");
          print(toJson());

          return;
        }
      }
    } else {
      for (int i = 0; i < library.length; i++) {
        if (library[i].id == serch) {
          library.removeAt(i);
          print("\n#####    Book has been del!    #####\n");
          print(toJson());

          return;
        }
      }
    }

    print("\n#####    Book has not been found!    #####\n");

    print(toJson());
  }

  void buyBook() {
    print(
        "\n######       chose book form this list that you want to buy     ######\n");

    for (var val in library) {
      print("-" * 25);
      print("\nid ---> ${val.id}");
      print("\ntitle ---> ${val.title}");
      //  for authors
      stdout.write("\nauthors ----> ");
      for (var authName in val.authors) {
        //  stdout.write() will print in the same line and the if condtion is jsut for dont add (,) in the end
        if (authName == val.authors.last) {
          stdout.write("$authName\n");
        } else {
          stdout.write("$authName , ");
        }
      }

// for categories
      stdout.write("\ncategories ----> ");
      for (var categoriesName in val.categories) {
        //  stdout.write() will print in the same line and the if condtion is jsut for dont add (,) in the end
        if (categoriesName == val.categories.last) {
          stdout.write("$categoriesName\n");
        } else {
          stdout.write("$categoriesName , ");
        }
      }

      print("\nyear ----> ${val.year}");
      print("\nquantity ----> ${val.quantity}");
      print("\nprice ----> ${val.price}");

      print("-" * 25);
    }

    whileBreak:
    while (true) {
      print(
          "\n######     chose book form this list that you want to buy above enter (0) if you want to cancel     ######\n");

      try {
        int buyId = int.parse(stdin.readLineSync()!);

        if (buyId == 0) {
          break whileBreak;
        }

        for (int i = 0; i < library.length; i++) {
          if (library[i].id == buyId.toString()) {
            if (library[i].quantity == 0) {
              print("\n#####    sorry book is out of stock!   #######\n");
              break;
            } else {
              library[i].quantity -= 1;

              user.bookBuy.add(library[i]);
              print(
                  "\n#####    book (${library[i].title}) has been purchased   #######\n");

              break whileBreak;
            }
          } else if (i == library.length - 1) {
            print("\n#####    chose book form the list!   #######\n");
          }
        }
      } catch (err) {
        print("\n#####    eorr only int no string   #######\n");
      }
    }
  }

  void displayReceipt() {
    print('\n');


    if(user.bookBuy.isNotEmpty){
      

      print("\n#####   your Receipt   #######\n");

    for (var val in user.bookBuy) {
      print("-" * 25);

      print("\ntitle ---> ${val.title}");
      //  for authors
      stdout.write("\nauthors ----> ");
      for (var authName in val.authors) {
        //  stdout.write() will print in the same line and the if condtion is jsut for dont add (,) in the end
        if (authName == val.authors.last) {
          stdout.write("$authName\n");
        } else {
          stdout.write("$authName , ");
        }
      }

// for categories
      stdout.write("\ncategories ----> ");
      for (var categoriesName in val.categories) {
        //  stdout.write() will print in the same line and the if condtion is jsut for dont add (,) in the end
        if (categoriesName == val.categories.last) {
          stdout.write("$categoriesName\n");
        } else {
          stdout.write("$categoriesName , ");
        }
      }

      print("\nyear ----> ${val.year}");

      print("\nprice ----> ${val.price}");

      print("-" * 25);
    }
    }
    else{
      print("\n#####    you did not buy any book   #######\n");
    }
  }

  void appRun() {}
}
