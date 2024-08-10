import 'dart:io';

import 'buy_books.dart';
import 'users_data.dart';
void login(){
    print("\n\n\n\n");
    print('------- Login -------');   
    bool wrongUser= false;
    do{
        print("please enter your username:");
        String? username = stdin.readLineSync();
        print("please enter your password:");
        String? password = stdin.readLineSync();
        for(Map<String,dynamic> customer in customers){
          if (customer['username']==username && customer["password"]==password){ //check if entered values are correct
            wrongUser= false; 
            buyBooks(username!);
          }
          else{ 
            print("username or password is wrong. Please try again");
            wrongUser= true;
          }
        }
    }while(wrongUser);
}