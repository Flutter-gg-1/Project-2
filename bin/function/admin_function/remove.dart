import 'dart:convert';
import 'dart:io';

import '../../utlis/print_with_color.dart';
import '../valdiation/nullchecker.dart';

remove() async {
  bool isBookFound = false;
  try {
    //git data from json
    String jsonData = await File('./bin/data.json').readAsString();
    Map<String, dynamic> data = jsonDecode(jsonData);

    PrintWithColor.green('Enter book id');
    String id = nullcheker(
        value: stdin.readLineSync().toString(),
        title: 'id',
        func: () => remove());
        
    //search for the book
    for (var element in (data['library'] as List)) {
      if ((element['id'] == id)) {
        isBookFound = true;
      }
    }
    if (isBookFound) {
      //update data
      (data['library'] as List).removeWhere((element) => element['id'] == id);

      //update json data
      String updatedJsonData = jsonEncode(data);
      File('./bin/data.json')
          .writeAsStringSync(updatedJsonData, mode: FileMode.write);

      PrintWithColor.green('Book with id $id is romved');
    } else {
      PrintWithColor.red('⚠️  Book not found');
    }
  } catch (e) {
    PrintWithColor.red('⚠️   Erorr : $e\nTry again');
    remove();
  }
}
