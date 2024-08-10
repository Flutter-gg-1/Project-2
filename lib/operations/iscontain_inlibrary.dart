import 'package:library_system/models/library.dart';

//this function return flase if not contain in the library
bool iscontain(StoreLibrary library, String id) {
  bool iscontain = false;
  for (var element in library.libraryBook) {
    if (element.id.contains(id)) {
      iscontain = true;
    }
  }
  return iscontain;
}
