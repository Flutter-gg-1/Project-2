import 'dart:io';

class JsonManager {
  // Read JSON file
  static String readJson(String path) {
    try {
      final file = File(path);
      final contents = file.readAsStringSync();
      return contents;
    } catch (e) {
      // To make an error :)
      throw Exception(e);
    }
  }

  // Write JSON content to file
  static void writeJson(String path, String json) {
    try {
      File(path).writeAsStringSync(json);
    } catch (e) {
      print(e);
    }
  }
}
