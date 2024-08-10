/* This file contains the functions to print colored text in the console. */

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m'); // Yellow
}

void printError(Object text) {
  print('\x1B[31m$text\x1B[0m'); // Red
}

void printInfo(String text) {
  print('\x1B[34m$text\x1B[0m'); // Blue
}

void printSuccess(String text) {
  print('\x1B[32m$text\x1B[0m'); // Green
}

void printPink(String text) {
  print('\x1B[35m$text\x1B[0m'); // Pink
}

void printGray(String text) {
  print('\x1B[90m$text\x1B[0m'); // Gray
}
