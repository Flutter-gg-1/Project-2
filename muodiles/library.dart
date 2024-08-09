class Library {
  Library({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.quantity,
    required this.price,
  });
  late final String id;
  late final String title;
  late final List<String> authors;
  late final List<String> categories;
  late final int year;
  late final int quantity;
  late final double price;

  Library.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    authors = List.castFrom<dynamic, String>(json['authors']);
    categories = List.castFrom<dynamic, String>(json['categories']);
    year = json['year'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['authors'] = authors;
    _data['categories'] = categories;
    _data['year'] = year;
    _data['quantity'] = quantity;
    _data['price'] = price;
    return _data;
  }
}
