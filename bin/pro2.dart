


import 'package:pro2/function/admin_comand.dart';
import 'package:pro2/json/json_data.dart';

import 'package:pro2/models/system_model.dart';

void main(){

  print("\n######            ######\n");



  SystemModel library = SystemModel.fromJson(jsonData);


  


  library.addBook(authors: ["ammar"] , categories: ["money"] , price: 100 , quantity: 4 , title: "live" , year: 1999 );
  library.removeBook(idNot: false , serch: "2");
  print(library.toJson());



  adminComand(library);

}