import 'package:library_system/models/user.dart';

receiptInfo(User user) {
  if (user.purchase.isNotEmpty) {
    print('\x1B[46;1mReceipt Purchase\x1B[0m');
    print('------------' * 5);
    for (var element in user.purchase) {
      print(
          'id: ${element['id']}\ntitle: ${element['title']}\nauthor: ${element['categories']}\nyear ${element['year']}\nquantity: ${element['quantity']}\nprice ${element['price']}');
      print('------------' * 5);
    }
  } else {
    print('there is no purchase yet');
  }
}
