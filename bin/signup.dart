import 'dart:io';
import 'start.dart';
import 'users_data.dart';

void customerSignup(){

  print("\n\n\n\n");
    print('------- Sign Up -------');
   while (true) {
    print("please enter a username:");
    String? username = stdin.readLineSync();
    print("please enter a password:");
    String? password = stdin.readLineSync();
    // Check for empty input first
    if (username!.isEmpty || password!.isEmpty) {
      print("Please enter a valid username and password");
    } else {
      // Check if username exists
      bool userExist = false; 
      for (Map<String, dynamic> customer in customers) {
        if (customer['username'] == username) {
          userExist = true;
          print("This username already exists, please choose another username.");
          break; // Exit the loop if username is found
        }
      }
      if (!userExist) { // If username doesn't exist, create the account
        Map<String, dynamic> newUser = {
          "username": username,
          "password": password
        };
        customers.add(newUser);
        print("Account created successfully!");
        stdin.readLineSync(); 
        start(); 
      }
    }
  }
  }