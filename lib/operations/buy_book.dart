import 'package:library_system/models/library.dart';

Map<String, dynamic> buyBook(StoreLibrary store, String bookId) {
  Map<String, dynamic> copyOfBuyingBook = {};
  bool bookFound = false;

  try {
    var book = store.libraryBook.firstWhere(
      (book) => book.id == bookId,
      orElse: () => throw Exception('\x1B[45;1mid book not found\x1B[0m'),
    );

    if (bookId.isNotEmpty && book.id.contains(bookId) && book.quantity > 0) {
      book.quantity--;
      print('Purchase is Done');
      copyOfBuyingBook = ({
        'id': book.id,
        'title': book.title,
        'authors': book.authors,
        'categories': book.categories,
        'year': book.year,
        'quantity': 1,
        'price': book.price
      });
      bookFound = true;
    }

    if (!bookFound) {
      print('\x1B[45;1mBook not found or out of stock\x1B[0m');
    }
  } catch (e) {
    print('\x1B[45;1mid book not founs\x1B[0m');
  }

  return copyOfBuyingBook;
}
