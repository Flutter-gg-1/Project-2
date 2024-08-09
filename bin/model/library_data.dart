import 'library.dart';

class LibraryData {
  List<Library>? library;

  LibraryData({this.library});

factory LibraryData.fromJson(Map<String, dynamic> json) {
    List<Library>? library;
    if (json['library'] != null) {
      library = [];
      json['library'].forEach((v) {
        library!.add(Library.fromJson(v));
      });
    }
    return LibraryData(
      library: library,
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (library != null) {
      data['library'] = library!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}