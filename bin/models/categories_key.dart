class Categories{
  final List<String> categories;
  Categories({required this.categories});
  // Factory Constructor for creating an instance of CategoriesKey from a JSON map
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      categories: json['categories'] as List<String>,
    );
  }
  // Convert an instance of CategoriesKey to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'categories': categories,
    };
  }
}