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
  late String id;
  late String title;
  late List<String> authors;
  late List<String> categories;
  late int year;
  late int quantity;
  late double price;
//factory with all class attrbute with json fromat to maping the jason
  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
        id: json['id'],
        title: json['title'],
        authors: List.castFrom<dynamic, String>(json['authors']),
        categories: List.castFrom<dynamic, String>(json['categories']),
        year: json['year'],
        quantity: json['quantity'],
        price: json['price']);
  }
//toJason to return all jason value
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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
