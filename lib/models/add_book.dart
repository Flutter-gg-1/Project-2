import 'dart:io'; // library used to interact with user
import 'package:library_system/models/book.dart'; // book class

// function to add book in library
void addBook({required List<Book> library}) {
  Map<String, dynamic> map = {};

  map['id'] = (library.length + 1).toString();

  stdout.write("Enter book title : ");
  String? title = stdin.readLineSync();
  map['title'] = title;

  stdout.write("How many authors ? : ");
  String? numOfAuthors = stdin.readLineSync();
  while (int.tryParse(numOfAuthors!) == null) {
    print("ERROR : Invalid number ❌\n");
    stdout.write("How many authors ? : ");
    numOfAuthors = stdin.readLineSync();
  }
  List<String> authors = [];
  for (int i = 0; i < int.parse(numOfAuthors); i++) {
    stdout.write("Enter author ${i + 1} name : ");
    authors.add(stdin.readLineSync()!);
  }
  map['authors'] = authors;

  stdout.write("How many categories ? : ");
  String? numOfCategories = stdin.readLineSync();
  while (int.tryParse(numOfCategories!) == null) {
    print("ERROR : Invalid number ❌\n");
    stdout.write("How many categories ? : ");
    numOfCategories = stdin.readLineSync();
  }
  List<String> categories = [];
  for (int i = 0; i < int.parse(numOfCategories); i++) {
    stdout.write("Enter category ${i + 1} name : ");
    categories.add(stdin.readLineSync()!);
  }
  map['categories'] = categories;

  stdout.write("Enter book year : ");
  String? year = stdin.readLineSync();
  while (int.tryParse(year!) == null) {
    print("ERROR : Invalid number ❌\n");
    stdout.write("Enter book year : ");
    year = stdin.readLineSync();
  }
  map['year'] = int.parse(year);

  stdout.write("Enter book quantity : ");
  String? quantity = stdin.readLineSync();
  while (int.tryParse(quantity!) == null) {
    print("ERROR : Invalid number ❌\n");
    stdout.write("Enter book quantity : ");
    quantity = stdin.readLineSync();
  }
  int bookQuantity = int.parse(year);
  map['quantity'] = bookQuantity;

  stdout.write("Enter book price in SR : ");
  String? price = stdin.readLineSync();
  while (double.tryParse(price!) == null) {
    print("ERROR : Invalid number ❌\n");
    stdout.write("Enter book price in SR : ");
    price = stdin.readLineSync();
  }
  double bookPrice = double.parse(price);
  map['price'] = bookPrice;

  library.add(Book.fromJson(map));
  print("Book ${library.last.title} is added to the library ✅\n");
}
