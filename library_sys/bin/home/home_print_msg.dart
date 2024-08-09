import '../model/user.dart';
import 'home.dart';

extension HomePrintMsgs on Home {
  void welcomeMsg() => print('Welcome to Fantasy Library!');

  void homeIndicatorMsg() => print('''
-----------------------------------
Logged in as ${currentUser?.name}
Enter i for instructions
-----------------------------------
''');

  void signInInstructions() => print('''
-----------------------------------
Select a USER ID from the list below to sign in.

${User.userList.map((user) => (user.id, user.name, user.userRole.name))}
-----------------------------------
''');

  void commandsInstructions() => print('''
------------------------------
Admin
--------
add  |  Add Book
rm   |  Remove Book
vcr  |  View Customer Reciepts
------------------------------
Customer
--------
buy  |  Buy Book
vmr  |  View My Reciepts
-----------------------------
''');

  void unknownCommand() => print('UNKNOWN COMMAND!');

  void terminateMsg() => print('Terminating App');

  void accessDenied() => print(
      'Oops! You cannot run this function with the current user. \n Try Signing in with a different user role');

  void signOutMsg() => print('User Signed OUt');
}
