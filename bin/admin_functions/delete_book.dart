import '../global_varbiels.dart';
import '../models/book_model.dart';

//function to delete book
deleteBook(String id) {
  Book? value;
  for (var element in library.library) {
    if (element.id == id) {
      value = element;
    }
  }
  if (value != null) {
    library.library.remove(value);
    print("-----Book with $id id is successfully-----");
  } else {
    print("Book not found!");
  }
}
