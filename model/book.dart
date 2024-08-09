class Book {
  late String id;
  late String title;
  late List<String> authors;
  late List<String> categories;
  late int year;
  late int quantity;
  late double price;

  Book(
      {required this.id,
      required this.title,
      required this.authors,
      required this.categories,
      required this.year,
      required this.quantity,
      required this.price});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    authors = json['authors'].cast<String>();
    categories = json['categories'].cast<String>();
    year = json['year'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['authors'] = authors;
    data['categories'] = categories;
    data['year'] = year;
    data['quantity'] =quantity;
    data['price'] = price;
    return data;
  }
}