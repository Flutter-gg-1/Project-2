import '../../model/users/admin.dart';
import '../../utlis/print_with_color.dart';

receipt({
  required String accountNumber,
  required String bookId,
  required double bookPrice,
  required double balance,
}){
String time = DateTime.now().toString();
String receipt = '==========receipt=========='
'\nAccount number : $accountNumber'
'\nBook id : $bookId'
'\nBook price : $bookPrice'
'\nNew account balance : $balance'
'\nTime : $time'
'\n========Thank you==========';

//update receiptLog
Admin.receiptLog.add(receipt);

PrintWithColor.purple(receipt);
}