import '../Users/admin.dart';
import '../muodiles/bookStore.dart';
import '../muodiles/libdata.dart';
import 'dart:io';
import '../Users/custmer.dart';

void main(List<String> arguments) {
  var admin = Admin(
    //user for admin
    userName: "admin",
    password: "admin",
  );
  var customer = Custmer(userName: "user", password: "user"); //user for custmer
  List<Map<String, dynamic>> resibies = []; //List to save all Receipt
  BookStore bookStore = BookStore.fromJson(data); //varible to store data (json)
  List<BookStore> books = []; //List from BookStore
  books.add(bookStore); //the List books add the book store
  while (true) {
    //the main while loop
    print("Enter Username:"); //log in
    String userName = stdin.readLineSync()!; //log in
    print("Enter Password:"); //log in
    String password = stdin.readLineSync()!; //log in
    //log in function
    if (userName == admin.userName && password == admin.password) {
      while (true) {
        //while loop for admin
        print("\nAdmin Menu:");
        print("1. View all library");
        print("2. Add books");
        print("3. Remove book");
        print("4. View purchase history");
        print("5. Switch to another user");
        print("6. Exit");
        int input = int.parse(stdin.readLineSync()!);

        switch (input) {
          //switch for admin input
          case 1:
            admin.viewAllBooks(bookStore); //function will view all the books
            break;
          case 2:
            admin.addBook(bookStore); //function to adding book
            break;
          case 3:
            admin.removeBook(bookStore); //removeing book
            break;
          case 4:
            admin.viewReceiptAdmin(
                resibies); //the function here to the value of the list above
            break;
          case 5:
            print("Switching user...");
            break;
          case 6:
            exit(0);
          default:
            print("Invalid option. Please try again.");
        }

        if (input == 5) break; // Exit the admin loop to allow user switch
      }
    } else if (userName == customer.userName && password == customer.password) {
      // for user login
      while (true) {
        print("\nCustomer Menu:");
        print("1. Buy a Book");
        print("2. View All Books");
        print("3.view  Receipts");
        print("4. Switch to another user");
        print("5. Exit");
        String choice = stdin.readLineSync()!;

        switch (choice) {
          //switch for user input
          case '1':
            resibies = customer.buyBook(
                bookStore); //function buy book after buing the return will asved into the list
            break;
          case '2':
            customer.viewAllBooks(bookStore); //to view all the books
            break;
          case '3':
            customer.viewReceipt(); //function to viewReceipt
            break;
          case '4':
            print("Switching user"); //switch user
          case '5':
            exit(0); //i user exit to exite from the while loop
          default:
            print("Invalid choice! Please select a valid option.");
        }

        if (choice == '4') break; //it will break to the main loop
      }
    } else {
      print(
          "Invalid username or password. Please try again."); //if the user is ivalid will print this or the user not difaind
    }
  }
}
