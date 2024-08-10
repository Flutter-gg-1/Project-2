import '../../function/admin_function/add.dart';
import '../../function/admin_function/add_account.dart';
import '../../function/admin_function/receipt_displayer.dart';
import '../../function/admin_function/remove.dart';
import '../../function/display.dart';
import '../../utlis/print_with_color.dart';

class Admin {
  static List receiptLog = [];
  void addBook()async{
    PrintWithColor.blue('=========Add Book=======');
    await add();
    PrintWithColor.blue('========================');
  }

  void removeBook()async{
    PrintWithColor.blue('=========Remove Book=======');
    await remove();
    PrintWithColor.blue('===========================');
  }

  void displayReceipt()async{
    PrintWithColor.blue('=========Receipt Records=======');
    await receiptDisplayer();
    PrintWithColor.blue('===============================');
  }

  void displayBook()async{
    PrintWithColor.blue('=========================');
    await bookDisplayer();
    PrintWithColor.blue('=========================');
  }

  void addCustomorAccount(){
    PrintWithColor.blue('=========Add Account=======');
     addAccount();
    PrintWithColor.blue('===========================');
  }
}
