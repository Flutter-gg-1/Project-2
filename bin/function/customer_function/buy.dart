import 'dart:convert';
import 'dart:io';

import '../../model/records.dart';
import '../../utlis/print_with_color.dart';
import '../display.dart';
import '../nullchecker.dart';
import 'receipt.dart';

buy() async {
  bookDisplayer();
  bool isBookFound = false;
  try {
    String jsonData = await File('./bin/data.json').readAsString();
    Map<String, dynamic> data = jsonDecode(jsonData);

    PrintWithColor.green('Enter the id for the book to buy it :');
    String id = nullcheker(
        value: stdin.readLineSync().toString(), title: 'id', func: () => buy());

    PrintWithColor.green('Enter your account number :');
    String accountNumber = nullcheker(
        value: stdin.readLineSync().toString(),
        title: 'Account number',
        func: () => buy());

    double price = 0;
    //search for book price
    for (var element in (data['library'] as List)) {
      if ((element['id'] == id && element['quantity'] > 0)) {
        price = element['price'];

        //update quantity
        element['quantity']--;

        //change search status
        isBookFound = true;

        //update data
        data.update('library', (value) => data['library']);
      }
    }
    if (!isBookFound) {
      PrintWithColor.red('Book not avilable');
    }
    //purches the book & check user balance
    else if (!Records.cards.containsKey(accountNumber)) {
      PrintWithColor.red('⚠️Wrong account number');
    } else if (Records.cards[accountNumber]! > price) {
      Records.cards.update(accountNumber, (value) => value - price);
      
      //update json file
      String updatedJsonData = jsonEncode(data);
      File('./bin/data.json')
          .writeAsStringSync(updatedJsonData, mode: FileMode.write);
      
      receipt(
        accountNumber: accountNumber, 
        bookId: id, 
        bookPrice: price, 
        balance: Records.cards[accountNumber]!
        );

      PrintWithColor.green('Thank you 😊 visit us again');
    } else {
      PrintWithColor.red('you do not have enoutgh balance to buy this book');
    }
  } catch (e) {
    PrintWithColor.red('⚠️Erorr : $e\nTry again');
    buy();
  }
}
