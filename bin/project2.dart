import 'dart:io';

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

void adminSignIn(){

  print("\n\n\n\n");
  print("Please enter admin password");
  String? password = stdin.readLineSync();
  int passwordEntryCount = 3;

  while(password!='123'){
  print("Wrong password, you have $passwordEntryCount attempts left");

  if(passwordEntryCount==0){
    print("You’ve reached the maximum login attempts.");
    exit(0);
  }
  passwordEntryCount--;
  password = stdin.readLineSync();
  }  
}

void customerSignIn(){

  print("\n\n\n\n");
  print('Do you have an account?');
  print("\n 1-Yes \n 2-No \n b-Back");
  String? choice = stdin.readLineSync();

  while(choice!='1' && choice!='2' && choice!='2'){
  print("please enter a valid option.");
  choice = stdin.readLineSync();
  }
  if(choice=='1'){
    login();
  }
  else if(choice=='2'){
    customerSignup();
  }
  else{
    main();
  }
}

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
            print("signed in ");
          }
          else{ 
            print("username or password is wrong. Please try again");
            wrongUser= true;
          }
        }
    }while(wrongUser);
}

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
      bool userExist = false; // Initialize to false
      for (Map<String, dynamic> customer in customers) {
        if (customer['username'] == username) {
          userExist = true;
          print("This username already exists, please choose another username.");
          break; // Exit the loop if username is found
        }
      }
      // If username doesn't exist, create the account
      if (!userExist) {
        Map<String, dynamic> newUser = {
          "username": username,
          "password": password
        };
        customers.add(newUser);
        print("Account created successfully!");
        stdin.readLineSync(); 
        main(); 
      }
    }
  }
  }


List<Map<String,dynamic>> customers = [
  {
    "username" : "user1",
    "password" : "123"
  }
];