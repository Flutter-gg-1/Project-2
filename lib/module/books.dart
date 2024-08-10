class Books {
  final String id;
  final String? title;
  final List<String> authors;
  final List<String> categories;
  final int year;
  int quantity;
  final double price;
  static int countId = 5;

  Books( // Constructor
      {required this.authors,
      required this.categories,
      required this.id,
      required this.price,
      required this.quantity,
      required this.year,
      required this.title});
  

  factory Books.fromJson(Map<String, dynamic> json) { // Factory 
    return Books(
        authors: List<String>.from(json["authors"] as List),
        categories: List<String>.from(json["categories"] as List),
        id: json["id"],
        price: json["price"],
        quantity: json["quantity"],
        year: json["year"],
        title: json["title"]);
  }

  Map<String, dynamic> toJson() => { // To Json if needed.
        "id": id,
        "title": title,
        "authors": authors,
        "categories": categories,
        "year": year,
        "quantity": quantity,
        "price": price
      };
}
