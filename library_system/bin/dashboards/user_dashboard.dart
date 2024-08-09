import 'dart:io';
import '../global_variabels.dart';
import 'admin_dashboard.dart';
import 'customer_dashboard.dart';
import '../model/customer.dart';

userDashboard() {
  print('''



WELCOME TO OUR LIBRARY SYSTEM !
---------------------------------------
Please select a number :

  1 | Login
  2 | Register new account
  C | Exit

''');

  try {
    String userInput1 = stdin.readLineSync()!;

    switch (userInput1) {
      case '1':
        print("Username :");
        String username = stdin.readLineSync()!;
        print("Password :");
        String password = stdin.readLineSync()!;

        userDashboardLogin(username, password);
        break;
      case '2':
        userDashboardCreateCustomer();
        break;
      case 'C' || 'c':
        isExitMainPage = true;
        break;
      default:
        print("Please enter a number as shown");
    }
  } on FormatException {
    print("Please enter a number ");
  } catch (e) {
    print(e);
  }
}

userDashboardLogin(String username, String password) {
  String value = "";
  int role = 0;
  bool isLogin = false;
  for (var element in customer) {
    if (username == element.username && password == element.password) {
      if (element.role == 1) {
        role = 1;
        isLogin = true;
        user = element;
        break;
      } else {
        role = 2;
        isLogin = true;
        user = element;
      }
    } else {
      value = "Sorry! your username or password isn't correct!";
      //print(value);
    }
  }
  if (isLogin == true && role == 1) {
    adminDashboard();
    isExitAdmin = false;
  } else if (isLogin == true && role == 2) {
    customerDashboard();
    isExitCustomer = false;
  } else {
    print(value);
  }
}

userDashboardCreateCustomer() {
  bool foundDuplicate = false;
  print("Enter a name");
  String inputUserName = stdin.readLineSync()!;
  print("Enter a phone");
  String inputUserPhone = stdin.readLineSync()!;
  print("Enter a username");
  String inputUserUsername = stdin.readLineSync()!;
  print("Enter a password");
  String inputUserPassword = stdin.readLineSync()!;

  for (var element in customer) {
    if (element.username.toString().toLowerCase() ==
        inputUserUsername.toString().toLowerCase()) {
      foundDuplicate = true;
      break;
    }
  }
  if (foundDuplicate == false) {
    var newCustomer = Customer(
        id: customerID,
        name: inputUserName,
        phone: inputUserPhone,
        username: inputUserUsername,
        password: inputUserPassword,
        role: 2);

    customer.add(newCustomer);
    customerID++;
  } else {
    print("Sorry!Please choose another username.");
  }
}
