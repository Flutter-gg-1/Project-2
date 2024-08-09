import '../model/library.dart';
import '../utils/filemngmt.dart';

void main(List<String> arguments) async {

  Library lib = Library([]);
  readFile(lib.books);

   lib.buyBook('5');
    print('====================');
   print(lib.toJson());

  // print(lib.toJson());
  // lib.buyBook('1');
  // print(lib.toJson());
}
