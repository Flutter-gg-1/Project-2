import 'library.dart';

class BookStore {
  //this calss is for the library to view all maps in library
  BookStore({
    required this.library,
  });
  late final List<Library> library;
//fctoury class to map all the jason values inside the data
  factory BookStore.fromJson(Map<String, dynamic> json) {
    return BookStore(
        library: List.from(json['library'])
            .map((e) => Library.fromJson(e))
            .toList());
  }
//toJson to implmint all the data
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['library'] = library.map((e) => e.toJson()).toList();
    return data;
  }
}
