


import 'package:pro2/json/json_data.dart';

import 'package:pro2/models/system_model.dart';

void main(){



  SystemModel book = SystemModel.fromJson(jsonData);


  // print(book.library[0].toJson());


  book.addBook(authors: ["ammar"] , categories: ["money"] , price: 100 , quantity: 4 , title: "live" , year: 1999 );
  book.removeBook(idNot: false , serch: "2");
  print(book.toJson());

}