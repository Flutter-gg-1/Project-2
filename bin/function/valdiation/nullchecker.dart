import '../utlis/print_with_color.dart';

nullcheker(
    {required var value, required String title, required Function func}) {
  if (value.isEmpty) {
    PrintWithColor.red('⚠️Erorr : empty $title\nTry again');
    return func;
  } else {
    return value;
  }
}
