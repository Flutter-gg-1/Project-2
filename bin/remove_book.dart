import 'library_list.dart';
import 'dart:io';

//this function is used by the admin to remove a book from the library
removebook({required int bookId}) {
  Map<String, dynamic> book = {};
  for (var element  in libraryList){
    if(element["id"] == bookId){
      book =element;
      break;
    }
  }
  try {
    if(book.isNotEmpty){
      libraryList.remove(book);
      print(" * The book is removed successfully *");
    }
    
  } catch (e) {
    print(" X Book id is not exist! X ");
    
  }

  

}
