import 'dart:io';

class ColorfulPrint {
  static void red(String text) => print('\x1B[31m🛑 $text 🛑\x1B[0m');
  static void green(String text) => print('\x1B[32m$text\x1B[0m');
  static void yellow(String text) => print('\x1B[33m$text\x1B[0m');
  static void blue(String text) => print('\x1B[34m$text\x1B[0m');
  static void magenta(String text) => print('\x1B[35m$text\x1B[0m');
  static void cyan(String text) => print('\x1B[36m$text\x1B[0m');
}

class ColorfulStdout {
  static void red(String text) => stdout.write('\x1B[31m🛑 $text 🛑\x1B[0m');
  static void green(String text) => stdout.write('\x1B[32m$text\x1B[0m');
  static void yellow(String text) => stdout.write('\x1B[33m$text\x1B[0m');
  static void blue(String text) => stdout.write('\x1B[34m$text\x1B[0m');
  static void magenta(String text) => stdout.write('\x1B[35m$text\x1B[0m');
  static void cyan(String text) => stdout.write('\x1B[36m$text\x1B[0m');
}
