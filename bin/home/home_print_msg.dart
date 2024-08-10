import '../model/user.dart';
import '../utils/colorful_print.dart';
import 'home.dart';

extension HomePrintMsgs on Home {
  void welcomeMsg() => print('Welcome to Fantasy Library!');

  void homeIndicatorMsg() => ColorfulPrint.magenta('''
-----------------------------------
Current User: ${currentUser?.name}, Role: ${currentUser?.userRole.name}
Enter i for instructions
-----------------------------------
''');

  void signInInstructions() => ColorfulPrint.yellow('''
-----------------------------------
Select a USER ID from the list below to sign in.

${User.userList.map((user) => (user.id, user.name, user.userRole.name))}
-----------------------------------
''');

  void commandsInstructions() => print('''
\x1B[33m------------------------------\x1B[0m
Common
--------
show |  View books
so   |  Sign out
q    |  Quit App
\x1B[33m------------------------------\x1B[0m
Admin
--------
add  |  Add Book
rm   |  Remove Book
vcr  |  View Customer Reciepts
\x1B[33m------------------------------\x1B[0m
Customer
--------
buy  |  Buy Book
vmr  |  View My Reciepts
\x1B[33m-----------------------------\x1B[0m
''');

  void unknownCommand() => ColorfulPrint.red('UNKNOWN COMMAND!');

  void terminateMsg() => ColorfulPrint.red('Terminating App');

  void accessDenied() => ColorfulPrint.red(
      'Oops! You cannot run this function with the current user. \n Try Signing in with a different user role');

  void signOutMsg() => ColorfulPrint.green('User Signed OUt');
}
