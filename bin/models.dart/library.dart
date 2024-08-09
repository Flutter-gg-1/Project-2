// This is librar class which is organize library
class Library {
  //Attributes
  final String id;
  final String title;
  final List<String> authors;
  final List<String> categories;
  final int year;
  final int quantity;
  final double price;
  //Constructor
  Library({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.quantity,
    required this.price,
  });
  //fromJson constractor
  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
      id: json["id"],
      title: json["title"],
      authors: List<String>.from(json["authors"].map((a) => a)),
      categories: List<String>.from(json["categories"].map((c) => c)),
      year: json["year"],
      quantity: json["quantity"],
      price: json["price"]?.toDouble(),
    );
  }
  //toJson return nedd data
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["id"] = id;
    data["title"] = title;
    data["authors"] = List<dynamic>.from(authors.map((a) => a));
    data["categories"] = List<dynamic>.from(categories.map((c) => c));
    data["year"] = year;
    data["quantity"] = quantity;
    data["price"] = price;
    return data;
  }
}
