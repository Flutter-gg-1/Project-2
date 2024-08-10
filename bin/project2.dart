

void main() {


}

class LibraryData {
  LibraryData({
    required this.library,
  });
  late final List<Library> library;
  
  LibraryData.fromJson(Map<String, dynamic> json){
    library = List.from(json['library']).map((e)=>Library.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['library'] = library.map((e)=>e.toJson()).toList();
    return data;
  }
}

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
   Map<String, dynamic>  data= {
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

Map<String, dynamic> libraryData = {
  "library": [
    {
      "id": "1",
      "title": "The Great Gatsby",
      "authors": ["F. Scott Fitzgerald"],
      "categories": ["Fiction"],
      "year": 1925,
      "quantity": 5,
      "price": 10.99
    },
    {
      "id": "2",
      "title": "To Kill a Mockingbird",
      "authors": ["Harper Lee"],
      "categories": ["Fiction", "Classic"],
      "year": 1960,
      "quantity": 0,
      "price": 12.99
    },
    {
      "id": "3",
      "title": "1984",
      "authors": ["George Orwell"],
      "categories": ["Dystopian", "Science Fiction"],
      "year": 1949,
      "quantity": 3,
      "price": 15.49
    },
    {
      "id": "4",
      "title": "Pride and Prejudice",
      "authors": ["Jane Austen"],
      "categories": ["Romance", "Classic"],
      "year": 1813,
      "quantity": 4,
      "price": 8.99
    },
    {
      "id": "5",
      "title": "The Catcher in the Rye",
      "authors": ["J.D. Salinger"],
      "categories": ["Fiction"],
      "year": 1951,
      "quantity": 2,
      "price": 13.49
    }
  ]
};