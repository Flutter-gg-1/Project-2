import '../global_varbiels.dart';

//function to display all books
listAllLibrary() {
  for (var element in library.library) {
    print("----------------------------------------");
    print(element.toJson());
  }
}
