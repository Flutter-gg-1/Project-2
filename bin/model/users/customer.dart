import '../../function/customer_function/buy.dart';
import '../../function/display.dart';
import '../../utlis/print_with_color.dart';

class Customer{

  buyABook(){
    PrintWithColor.blue('==========Welcom===========');
    buy();
    PrintWithColor.blue('===========================');
  }

  showBookList(){
    PrintWithColor.blue('==========Welcom===========');
    bookDisplayer();
    PrintWithColor.blue('===========================');
  }
}