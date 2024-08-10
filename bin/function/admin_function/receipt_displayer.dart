import '../../model/users/admin.dart';
import '../../utlis/print_with_color.dart';

receiptDisplayer(){
  for (var element in Admin.receiptLog) {
    PrintWithColor.purple('$element');
  }
  PrintWithColor.blue('=========receipt records=======');
}