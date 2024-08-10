import 'library.dart';

class LibraryData {
  LibraryData({
    required this.library,
  });
  late final List<Library> library;
  
  LibraryData.fromJson(Map<String, dynamic> json){
    library = List.from(json['library']).map((e)=>Library.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['library'] = library.map((e)=>e.toJson()).toList();
    return data;
  }
}