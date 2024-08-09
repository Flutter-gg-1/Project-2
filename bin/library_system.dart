import 'core/all_file.dart';
void main() {
  print("Hello, World!");

  LibraryModel libraryModel = LibraryModel(
    library: libraryJSONData['library'],
  );

  print(libraryModel.toJson());

}
