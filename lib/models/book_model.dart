

class BookModel {
  String id;
  String title;
  List<String> authors;
  List<String> categories;
  int year;
  int quantity;
  double price;

  BookModel({
    required this.authors,
    required this.categories,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
    required this.year,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        authors: json["authors"],
        categories: json["authors"],
        id: json["id"],
        price: json["price"],
        quantity: json["quantity"],
        title: json['title'],
        year: json["year"]);
  }





  Map<String,dynamic>  toJson(){

    return{

        "id": id,
      "title": title,
      "authors": authors,
      "categories": categories,
      "year": year,
      "quantity": quantity,
      "price": price


    };
  }
}
