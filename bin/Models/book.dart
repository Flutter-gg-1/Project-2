class Book {
  String id;
  String title;
  List<String> authors;
  List<String> categories;
  int year;
  int quantity;
  double price;

  Book(
      {required this.id,
      required this.title,
      required this.authors,
      required this.categories,
      required this.year,
      required this.quantity,
      required this.price});
  
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        title: json['title'],
        authors: json['authors'].cast<String>(),
        categories: json['categories'].cast<String>(),
        year: json['year'],
        quantity: json['quantity'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['authors'] = authors;
    data['categories'] = categories;
    data['year'] = year;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
