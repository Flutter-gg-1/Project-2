import '../model/library.dart';
import '../utils/filemngmt.dart';

void main(List<String> arguments) async {

  Library lib = Library(books: []);
  readFile(lib.books);

  lib.removeBook('1');

  // print(lib.toJson());
  // lib.buyBook('1');
  // print(lib.toJson());
}
