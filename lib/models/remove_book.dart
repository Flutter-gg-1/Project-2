import 'dart:io'; // library used to interact with user
import 'package:library_system/models/book.dart'; // book class


// library to remove book from library
void removeBook({required List<Book> library, required String id}) {
  print("Enter 0 to BACK");
  while(library.map((book)=>book.id).toList().contains(id)==false) {
    print("ERROR : Invalid book id ❌\n");
    stdout.write("Enter book id : ");
    id = stdin.readLineSync()!;
    if(id=='0') {
      return;
    }
  }
  int bookNum = library.map((book)=>book.id).toList().indexOf(id);
  Book book = library[bookNum];
  library.removeWhere((book)=>book.id == id);
  print("Book ${book.title} got removed successfully ✅");
}