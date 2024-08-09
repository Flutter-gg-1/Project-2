import 'package:pro2/models/book_model.dart';
import 'package:pro2/models/user_model.dart';

class SystemModel {
  List<BookModel> library = [];

  static int lastBookId = 0;

  // this List have UserModel and in it have the first admin that can add new Admin in the system
  List<UserModel> usermModelLis = [UserModel(userName: "admin", passWord: "1234",isAdmin: true)];

  SystemModel({required this.library});

  factory SystemModel.fromJson(Map<String, dynamic> json) {
    List<BookModel> lis = [];

    for (var val in json["library"]) {
      lis.add(BookModel.fromJson(val));
    }

    // check what the last book id that has been add in the system so we save it in order so it been automatic

    lastBookId = int.parse(lis.last.id);

    return SystemModel(library: lis);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> tempMap = [];

    for (var val in library) {
      tempMap.add(val.toJson());
    }

    return {"library": tempMap};
  }

  void addBook(
      {
      required String title,
      required List<String> authors,
      required List<String> categories,
      required int year,
      required int quantity,
      required double price}) {


        library.add(BookModel(authors: authors, categories: categories, id: (lastBookId+1).toString(), price: price, quantity: quantity, title: title, year: year));
      }


      void removeBook({required serch , required bool idNot}){

        if(idNot){

          for(int i = 0 ; i< library.length ; i++){

            if(library[i].title == serch){
              library.removeAt(i);

              return;

            }
          }

        }
        else{


          for(int i = 0 ; i< library.length ; i++){

            if(library[i].id == serch){
              library.removeAt(i);
              
              return;

            }
          }

        }

      }

  void appRun() {}
}
