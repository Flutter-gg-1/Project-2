class CategoriesKey{
  final List<String> categories;
  CategoriesKey({required this.categories});
  // Factory Constructor for creating an instance of CategoriesKey from a JSON map
  factory CategoriesKey.fromJson(Map<String, dynamic> json) {
    return CategoriesKey(
      categories: List<String>.from(json['categories']),
    );
  }
  // Convert an instance of CategoriesKey to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'categories': categories,
    };
  }
}