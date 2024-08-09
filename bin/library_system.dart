import 'core/all_file.dart';

void main() {
  LibraryModel libraryObject = LibraryModel.fromJson(libraryJSONData);
  print(libraryObject.toJson());
}
