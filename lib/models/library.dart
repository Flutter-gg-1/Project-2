import 'dart:io';
import 'dart:math';

class StoreLibrary {
  List<Book> libraryBook;

  StoreLibrary({required this.libraryBook});

  factory StoreLibrary.fromJson(Map<String, dynamic> json) {
    return StoreLibrary(
        libraryBook: (json['library'] as List)
            .map((emp) => Book.fromJson(emp))
            .toList());
  }

  toJson() {
    return {
      'library': libraryBook.map((emp) => emp.toJson()).toList()
      // libraryBook.map((emp) => emp.toJson()).toList(),
    };
  }

//function to remove book
  void removeBook(String bookId) {
    libraryBook.removeWhere((book) => book.id == bookId);
    print('Book ID$bookId has been removed');
  }

//function to add book in data json
  void addNewBook(StoreLibrary store) {
    print('you are adding a new Book to the Library');
    //declartion of arguments of book
    late String title;
    late List<String> author;
    late List<String> category;
    late String categoryInput;
    String authorinput;
    late int year;
    late int quantity;
    late double price;
    bool isExit = false;
    //this do while to force the user to input values in string will not exit until fill it all
    do {
      print(
          '\n\n\x1B[45;1myou must fill the right data to continue do not leave it Empty\x1B[0m');
      //
      stdout.write("Book Title: ");
      title = stdin.readLineSync()!;
      stdout.write("Book author: ");
      authorinput = stdin.readLineSync()!;
      stdout.write("Book category: ");
      categoryInput = stdin.readLineSync()!;
      if (title != '' && authorinput != '' && categoryInput != '') {
        isExit = true;
      }
    } while (!isExit);
    //initialize values to store it in list
    category = [categoryInput];
    author = [authorinput];

    //this do while for numric values to force the user to write it will not exit until initialize values
    bool isvalue = false;
    do {
      try {
        stdout.write("Book year: ");
        year = int.tryParse(stdin.readLineSync()!)!;
        stdout.write("Book quantity: ");
        quantity = int.tryParse(stdin.readLineSync()!)!;
        stdout.write("Book price: ");
        price = double.tryParse(stdin.readLineSync()!)!;
        isvalue = true;
      } catch (e) {
        print('\x1B[45;1monly numric values to continue your operation\x1B[0m');
      }
    } while (!isvalue);

    //id book
    int id = store.libraryBook.length + Random().nextInt(10);

    //store it in object of class
    Book newBook = Book(
        id: id.toString(),
        title: title,
        authors: author,
        categories: category,
        year: year,
        quantity: quantity,
        price: price);
    //add the new book
    libraryBook.add(newBook);
    print('new Book is added');
    stdin.readLineSync();
  }
}

class Book {
  String id;
  String title;
  List<String> authors;
  List<String> categories;
  int? year;
  int quantity;
  double? price;

  Book(
      {required this.id,
      required this.title,
      required this.authors,
      required this.categories,
      required this.year,
      required this.quantity,
      required this.price});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        title: json['title'],
        authors: json['authors'],
        categories: json['categories'],
        year: json['year'],
        quantity: json['quantity'],
        price: json['price']);
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['authors'] = authors;
    data['categories'] = categories;
    data['year'] = year;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }

  void buyBooks(Book book) {}
}
