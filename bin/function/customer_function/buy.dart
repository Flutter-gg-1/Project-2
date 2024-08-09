import 'dart:convert';
import 'dart:io';

import '../../model/records.dart';
import '../../utlis/print_with_color.dart';
import '../display.dart';
import '../nullchecker.dart';

buy() async {
  bookDisplayer();
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
      if ((element['id'] == id)) {
        price = element['price'];
      }
    }
    //purches the book & check user balance
    if (!Records.cards.containsKey(accountNumber)) {
      PrintWithColor.red('Wrong account number');
    } else if (Records.cards[accountNumber]! > price) {
      Records.cards.update(accountNumber, (value) => value - price);
      //update book status
      Records.unavilableBook.add(id);
      print('Done');
    } else {
      PrintWithColor.red('you do not have enoutgh balance to buy this book');
    }
  } catch (e) {
    PrintWithColor.red('Erorr : $e\nTry again');
    buy();
  }
}
