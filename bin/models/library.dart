
class Library {

   final String id;
   final String title;
   final List<String> authors;
   final List<String> categories;
   final int year;
   final int quantity;
   final double price;

    Library({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.quantity,
    required this.price,
  });

  factory Library.fromJson(Map<String, dynamic> json){
    return Library(
    id : json['id'],
    title : json['title'],
    authors : List.castFrom<dynamic, String>(json['authors']),
    categories : List.castFrom<dynamic, String>(json['categories']),
    year : json['year'],
    quantity : json['quantity'],
    price : json['price'],
    );
  }

 toJson() {
   Map<String, dynamic> data= {
    'id' : id,
    'title' : title,
    'authors' : authors,
    'categories' : categories,
    'year' : year,
    'quantity' : quantity,
    'price' : price,
   };
    return data;
  }


}
