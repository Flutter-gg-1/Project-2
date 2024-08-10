import 'dart:io';
import 'package:library_system/models/library.dart';
import 'package:library_system/models/user.dart';
import 'package:library_system/data/jsondata.dart';
import 'package:library_system/operations/panel.dart';
import 'package:library_system/operations/buy_book.dart';
import 'package:library_system/operations/iscontain_inlibrary.dart';

void main() {
  StoreLibrary store = StoreLibrary.fromJson(jsonData);

  //admin account
  User adminUser =
      User(id: 'admin-1a', name: 'Anas', password: 'admin1', role: 'admin');
  //customer account
  User custmerUser = User(
      id: 'customer-1b', name: 'bdr', password: 'customer1', role: 'customer');

  //bool to Exit customer / admin mode or exit console
  bool isExit = false;
  bool customerExit = false;
  bool adminExit = false;

  do {
    //panel function
    welcoming();
    var userInput = stdin.readLineSync();
    switch (userInput) {
      //#######################
      //for admin panel
      case '0':
        //if the user role is admin will enter (Admin Mode)
        if (adminUser.role != 'customer') {
          do {
            //panel show for Admin
            adminExit = false;
            adminPanel();
            userInput = stdin.readLineSync();
            switch (userInput) {
              //add Books
              case '0':
                store.addNewBook(store);
                break;
              //remove Book
              case '1':
                print(
                    'to remove a book you need to display books to get the id');
                stdout.write("ID Book: ");
                String userInput = stdin.readLineSync()!;
                if (userInput.isNotEmpty) {
                  print(store.libraryBook.last.id);
                  if (iscontain(store, userInput)) {
                    print('Successfully removed');
                    store.removeBook(userInput);
                  } else {
                    print('book not found');
                  }
                } else {
                  print('your need to enter ID Book');
                }

                break;
              //display Resepit purchase
              case '2':
                if (custmerUser.purchase.isNotEmpty) {
                  print('\x1B[46;1mReceipt Purchase\x1B[0m');
                  print('------------' * 5);
                  for (var element in custmerUser.purchase) {
                    print(
                        'id: ${element['id']}\ntitle: ${element['title']}\nauthor: ${element['categories']}\nyear ${element['year']}\nquantity: ${element['quantity']}\nprice ${element['price']}');
                    print('------------' * 5);
                  }
                } else {
                  print('there is no purchase yet');
                }
                break;
              //display all books in libraries
              case '3':
                for (var element in store.libraryBook) {
                  print('---------------' * 10);
                  print(element.toJson());
                  print('---------------' * 10);
                }
                stdin.readLineSync();
                break;
              //Exit admin mode
              case 'q' || 'Q':
                adminExit = true;
                break;
              default:
                print('please enter one of the values on panel');
            }
          } while (!adminExit);
        } else {
          print('you are not allowed only for admin');
        }
        break;
      //#######################
      //for customer
      case '1':
        //if the user role is customer will enter (Customer Mode)
        if (custmerUser.role != 'admin') {
          do {
            customerExit = false;
            //panel show for Customer
            customerPanel();
            userInput = stdin.readLineSync();

            switch (userInput) {
              //buy book
              case '0':
                //purchase function
                print('Enter ID of the book to buy it');
                String bookId = stdin.readLineSync()!;
                if (bookId != '') {
                  //this function return
                  custmerUser.purchase.add(buyBook(store, bookId));
                } else {
                  print('enter a right id Book');
                }
                break;
              //print recipt purchase
              case '1':
                if (custmerUser.purchase.isNotEmpty) {
                  print('\x1B[46;1mReceipt Purchase\x1B[0m');
                  print('------------' * 5);
                  for (var element in custmerUser.purchase) {
                    print(
                        'id: ${element['id']}\ntitle: ${element['title']}\nauthor: ${element['categories']}\nyear ${element['year']}\nquantity: ${element['quantity']}\nprice ${element['price']}');
                    print('------------' * 5);
                  }
                } else {
                  print('there is no purchase yet');
                }
                break;
              //display all book
              case '2':
                print('\n\nour list in library');
                for (var element in store.libraryBook) {
                  if (element.quantity > 0) {
                    print('---------------' * 10);
                    print(element.toJson());
                    print('---------------' * 10);
                  }
                }
                break;
              //exit customer mood
              case 'q' || 'Q':
                customerExit = true;
                break;
              default:
                print('please enter one of the values on panel');
            }
          } while (!customerExit);
        } else {
          print('only for custmers');
        }
        break;
      //exit
      case 'q' || 'Q':
        isExit = true;
      default:
        print('please enter one of the values on panel');
    }
  } while (!isExit);
}
