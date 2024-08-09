import 'dart:convert';
import 'dart:io';
import 'dart:math';

import '../../utlis/print_with_color.dart';
import '../nullchecker.dart';

add() async {
  try {
    String id = '${Random().nextInt(999999) + 111111}';

    PrintWithColor.green('enter title : ');
    String title = nullcheker(
        value: stdin.readLineSync().toString(),
        title: 'title',
        func: () => add());

    PrintWithColor.green('enter authors : ');
    List authors = [stdin.readLineSync().toString()];

    PrintWithColor.green('enter categories : ');
    List categories = [stdin.readLineSync().toString()];

    PrintWithColor.green('enter year : ');
    int year = int.parse(stdin.readLineSync().toString());

    PrintWithColor.green('enter quantity : ');
    int quantity = int.parse(stdin.readLineSync().toString());

    PrintWithColor.green('enter price : ');
    double price = double.parse(stdin.readLineSync().toString());

    String jsonData = await File('./bin/data.json').readAsString();
    Map<String, dynamic> data = jsonDecode(jsonData);

    Map<String, dynamic> list = {};
    list.addAll({
      "id": id,
      "title": title,
      "authors": authors,
      "categories": categories,
      "year": year,
      "quantity": quantity,
      "price": price
    });

    data['library']?.add(list);

    String updatedJsonData = jsonEncode(data);
    File('./bin/data.json')
        .writeAsStringSync(updatedJsonData, mode: FileMode.write);

    PrintWithColor.green('Book has been add to the library');
    stdin.readLineSync();
  } catch (e) {
    PrintWithColor.red('error $e Try again');
    add();
  }
}
