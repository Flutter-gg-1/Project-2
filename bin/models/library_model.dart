class LibraryModel {
  final List<Map<String, dynamic>> library;

  LibraryModel({required this.library});

  // Factory constructor(deserialize) to create a LibraryModel from JSON data
  factory LibraryModel.fromJson(Map<String, dynamic> json) {
    return LibraryModel(
      library: json['library'] as List<Map<String, dynamic>>,
    );
  }
  // Convert the LibraryModel to JSON data for serialization by using the toJson method
  Map<String, dynamic> toJson() {
    return {
      'library': library,
    };
  }
}
