import 'library.dart';
class BookStore {
  BookStore({
    required this.library,
  });
  late final List<Library> library;

  BookStore.fromJson(Map<String, dynamic> json) {
    library =
        List.from(json['library']).map((e) => Library.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['library'] = library.map((e) => e.toJson()).toList();
    return _data;
  }
}
