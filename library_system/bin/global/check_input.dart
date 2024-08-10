import './print_with_color.dart';

bool checkInput(dynamic value, String output) {
  if (value.isEmpty) {
    PrintWithColors.red(output);
    return false;
  } else {
    return true;
  }
}
