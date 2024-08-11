import 'library.dart';

class LibraryData {
  final List<Library> library;
 
  LibraryData({
    required this.library,
  });
  
  factory LibraryData.fromJson(Map<String, dynamic> json){
     return LibraryData(
      library: List.from(json['library']).map((e) => Library.fromJson(e)).toList(),
    );}

  Map<String, dynamic> toJson() {
    Map <String, dynamic> data = {
    'library' : library.map((e)=>e.toJson()).toList()
    };
    return data;
  }
}