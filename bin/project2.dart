import 'dart:io';
import 'customer_signin.dart';
import 'admin_signup.dart';

void main() {

print("\n\n\n\n");
print("===Welcome to our Library System===");
print("-----------------------------------");
print("             Log in as:");
print("\n 1-Admin \n 2-Customer \n e-Exit");
String? userType = stdin.readLineSync();

while(userType!='1' && userType!='2' && userType!='e'){
print("please enter a valid option.");
userType = stdin.readLineSync();
}
if(userType=='1'){
  adminSignIn();
}
else if(userType=='2'){
  customerSignIn();
}
else{
  print("Goodbye");
  exit(0);
}

}













