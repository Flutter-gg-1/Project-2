import 'library.dart';

// This is librarySystem class which is contain library list
class LibrarySystem {
  //Attributes
  List<Library> library;
  //Constructor
  LibrarySystem({required this.library});
  //fromJson constractor
  factory LibrarySystem.fromJson(Map<String, dynamic> json) {
    return LibrarySystem(
        library: List<Library>.from(
            json["library"].map((l) => Library.fromJson(l))));
  }
  //toJson return nedd data
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["library"] = List<dynamic>.from(library.map((l) => l.toJson()));
    return data;
  }
}
