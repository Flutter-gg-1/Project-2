// This is librar class which is contains book data
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
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "authors": authors.map((a) => a).toList(),
        "categories": categories.map((c) => c).toList(),
        "year": year,
        "quantity": quantity,
        "price": price,
      };
}
