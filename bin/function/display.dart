import 'dart:convert';
import 'dart:io';

import '../utlis/print_with_color.dart';

bookDisplayer() async {
  String jsonData = await File('./bin/data.json').readAsString();
  Map<String, dynamic> data = jsonDecode(jsonData);
  PrintWithColor.green('==========Book List============');
  for (var element in (data['library'] as List)) {
    PrintWithColor.purple('=========Book============');
    (element as Map).forEach((key, value) {
      print('$key : $value');
    });
    PrintWithColor.purple('=========================\n');
  }
  PrintWithColor.green('^^^^^^^^^^Book list^^^^^^^^^^^^');
}
