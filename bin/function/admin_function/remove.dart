import 'dart:convert';
import 'dart:io';

import '../../utlis/print_with_color.dart';
import '../nullchecker.dart';

remove() async {
  try {
    String jsonData = await File('./bin/data.json').readAsString();
    Map<String, dynamic> data = jsonDecode(jsonData);

    PrintWithColor.green('Enter book id');
    String id = nullcheker(
        value: stdin.readLineSync().toString(),
        title: 'id',
        func: () => remove());

    (data['library'] as List).removeWhere((element) => element['id'] == id);

    String updatedJsonData = jsonEncode(data);
    File('./bin/data.json')
        .writeAsStringSync(updatedJsonData, mode: FileMode.write);
        PrintWithColor.green('Book with id $id is romved');
  } catch (e) {
    PrintWithColor.red('Erorr : $e\nTry again');
    remove();
  }
}