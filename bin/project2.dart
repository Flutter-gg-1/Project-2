import 'dart:io';

void main() {

print("\n\n\n\n");
print("===Welcome to our Library System===");
print("-----------------------------------");
print("             Log in as:");
print("\n 1-Admin \n 2-Customer");
String? userType = stdin.readLineSync();

while(userType!='1' && userType!='2'){
print("please enter a valid option.");
userType = stdin.readLineSync();
}
if(userType=='1'){
  print("admin");
}
else{
  print("customer");
}


}

