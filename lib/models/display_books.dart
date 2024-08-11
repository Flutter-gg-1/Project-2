import 'package:library_system/models/book.dart'; // book class

void displayBooks({required List<Book> library}) {
  if (library.isEmpty) {
    print("ERROR : No books added to the library yet ❌\n");
    return;
  }
  for (var book in library) {
    Map<String, dynamic> map = book.toJson();
    print('Book id : ${map['id']}');
    print('Book title : ${map['title']}');
    print('Book authors : ${map['authors']}');
    print('Book categories : ${map['categories']}');
    print('Book year : ${map['year']}');
    print('Book Current quantity : ${map['quantity']}');
    print("Book Price : ${map['price']} SR");
    print("*" * 40);
  }
  print("Total books = ${library.length} Books");
}
