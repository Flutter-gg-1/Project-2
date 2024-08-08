class LibrarySystem{
  final String id;
  final String title;
  final String authors;
  final String categories;
  final int year;
  final int quantity;

  LibrarySystem({required this.authors, required this.categories, required this.id, required this.quantity, required this.title, required this.year});

  factory LibrarySystem.fromJson(Map<String,dynamic> json){
    return LibrarySystem(authors: json["authors"], categories: json["categories"], id: json["id"], quantity: json["quantity"], title: json["title"], year: json["year"]);
  }

  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "title": title,
      "authors": authors,
      "categories": categories,
      "year": year,
      "quantity": quantity,
    };
  }
}