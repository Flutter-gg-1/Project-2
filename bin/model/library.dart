class Library {
  String id;
  String title;
  List<String> authors;
  List<String> categories;
  int year;
  int quantity;
  double price;

  Library(
      {
      required this.id,
      required this.title,
      required this.authors,
      required this.categories,
      required this.year,
      required this.quantity,
      required this.price
      }
      );

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
    id : json['id'],
    title : json['title'],
    authors : json['authors'].cast<String>(),
    categories : json['categories'].cast<String>(),
    year : json['year'],
    quantity : json['quantity'],
    price : json['price'],
    );
  }

  Map<String, dynamic> toJson() {
  return {
    'id' : id,
    'title' : title,
    'authors' : authors,
    'categories' : categories,
    'year' : year,
    'quantity' : quantity,
    'price': price,
  };
  }
}