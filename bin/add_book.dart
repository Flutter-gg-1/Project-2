import 'dart:io';
import 'print_with_color.dart';
import 'library_data.dart';
import 'admin.dart';
  
addBook() {
  print("Enter book's id: ");
  String bookId = stdin.readLineSync()!;
  print("Enter book's title: ");
  String bookTitle = stdin.readLineSync()!;
  print("Enter book's authors: ");
  final bookAuthors = stdin.readLineSync()?.trim().split(',') ?? [];
  print("Enter book's categories: ");
  final bookCategories = stdin.readLineSync()?.trim().split(',') ?? [];
  print("Enter book's year: ");
  int? bookYear;
  try {
    bookYear = int.parse(stdin.readLineSync()!);
  } catch (error) {
    printWithColor(text: "A number must be entered.", color: "Red");
    print(error);
    printWithColor(
        text: "\nTo return back to the main features press (Enter)\n",
        color: "Black");
    stdin.readLineSync();
    admin();
  }
  print("Enter book's quantity: ");
  int? bookQuantity;
  try {
    bookQuantity = int.parse(stdin.readLineSync()!);
  } catch (error) {
    printWithColor(text: "A number must be entered.", color: "Red");
    print(error);
    printWithColor(
        text: "\nTo return back to the main features press (Enter)\n",
        color: "Black");
    stdin.readLineSync();
    admin();
  }
  print("Enter book's price: ");
  double? bookPrice;
  try {
    bookPrice = double.parse(stdin.readLineSync()!);
  } catch (error) {
    printWithColor(text: "\nA number must be entered.", color: "Red");
    print(error);
    printWithColor(
        text: "\nTo return back to the main features press (Enter)\n",
        color: "Black");
    stdin.readLineSync();
    admin();
  }

  Map<String,dynamic> book = {
      "authors": bookAuthors,
      "categories": bookCategories,
      "id": bookId,
      "quantity": bookQuantity,
      "title": bookTitle,
      "year": bookYear,
      "price": bookPrice};
  
  List<dynamic> books = List.from(libraryData['library']);
  books.add(book);
  libraryData['library'] = books;
  printWithColor(text: "\nThe book was successfully added!", color: "Green");
  printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
  stdin.readLineSync();
}
