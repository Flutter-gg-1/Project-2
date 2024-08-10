/*
This class containing the book detail 
 */

class Book {
  final String id;
  final String title;
  final List<String> authors;
  final List<String> categories;
  final int year;
  final int quantity;
  final double price;
  // constructor
  Book(
      {required this.authors,
      required this.categories,
      required this.id,
      required this.quantity,
      required this.title,
      required this.year,
      required this.price});
      // factory cinstructor to convert Json data to object
  factory Book.fromJson(Map<String, dynamic> json){ 
        return Book(
            id: json["id"],
            title: json["title"],
            authors: json["authors"] == null ? [] : List<String>.from(json["authors"]!.map((x) => x)),
            categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
            year: json["year"],
            quantity: json["quantity"],
            price: json["price"],
        );
    }
    // convert an object to Json format
    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "authors": authors.map((e) => e).toList(),
        "categories": categories.map((e) => e).toList(),
        "year": year,
        "quantity": quantity,
        "price": price,
    };
}

