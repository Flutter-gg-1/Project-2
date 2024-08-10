import '../../function/customer_function/buy.dart';
import '../../function/display.dart';
import '../../utlis/print_with_color.dart';

class Customer{

  buyABook()async{
    PrintWithColor.blue('==========Welcome===========');
    await buy();
    PrintWithColor.blue('===========================');
  }

  showBookList()async{
    PrintWithColor.blue('==========Welcom===========');
    await bookDisplayer();
    PrintWithColor.blue('===========================');
  }
}