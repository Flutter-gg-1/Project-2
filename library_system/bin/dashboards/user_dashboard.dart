import 'dart:io';
import '../global/global_variabels.dart';
import 'admin_dashboard.dart';
import 'customer_dashboard.dart';
import '../model/customer.dart';
import '../global/print_with_color.dart';
import '../global/press_enter.dart';
import '../global/check_input.dart';

userDashboard() {
  PrintWithColors.yellow('''








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
        getInfoLoginPage();
        break;
      case '2':
        userDashboardCreateCustomer();
        pressEnter();
        break;
      case 'C' || 'c':
        isExitMainPage = true;
        break;
      default:
        print("Please enter a number as shown");
    }
  } on FormatException {
    print("Please enter a number");
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
    }
  }
  if (isLogin == true && role == 1) {
    adminDashboard();
    isExitAdmin = false;
  } else if (isLogin == true && role == 2) {
    customerDashboard();
    isExitCustomer = false;
  } else {
    PrintWithColors.red(value);
    pressEnter();
  }
}

userDashboardCreateCustomer() {
  bool foundDuplicate = false;
  bool isExitInputName = false;
  bool isExitInputPhone = false;
  bool isExitInputUsername = false;
  bool isExitInputPassword = false;

  String? inputUserName;
  String? inputUserPhone;
  String? inputUserUsername;
  String? inputUserPassword;

  do {
    print("Enter a name");
    inputUserName = stdin.readLineSync()!;
    isExitInputName = checkInput(inputUserName, "Please enter your name");
  } while (!isExitInputName);

  do {
    print("Enter a phone");
    inputUserPhone = stdin.readLineSync()!;
    isExitInputPhone = checkInput(inputUserPhone, "Please enter your phone ");
  } while (!isExitInputPhone);

  do {
    print("Enter a username");
    inputUserUsername = stdin.readLineSync()!;
    isExitInputUsername =
        checkInput(inputUserUsername, "Please enter your username");
  } while (!isExitInputUsername);

  do {
    print("Enter a password");
    inputUserPassword = stdin.readLineSync()!;
    isExitInputPassword =
        checkInput(inputUserPassword, "Please enter your password");
  } while (!isExitInputPassword);

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
    PrintWithColors.green("Customer created :)");
  } else {
    PrintWithColors.red("Sorry!Please choose another username.");
  }
}

getInfoLoginPage() {
  PrintWithColors.yellow('''

HOME -> LOGIN
---------------------------------------
''');
  print("Username :");
  String username = stdin.readLineSync()!;
  print("Password :");
  String password = stdin.readLineSync()!;

  userDashboardLogin(username, password);
}
