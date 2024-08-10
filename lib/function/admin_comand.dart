










import 'dart:io';

import 'package:pro2/models/system_model.dart';

bool adminComand(SystemModel library){

int op = 0;

  while(true){

      print("\n\n");
    print(" &---> Hello to Library System <---& \n");
    print("0: Add a Book:"); 
    print("-"*25);
    print("1: Remove a Book");
    print("-"*25);
    print("2: Buy a Book");
    print("-"*25);
    print("3: Display Receipt");
    print("-"*25);
    print("4: add Admin");
    print("-"*25);
    print("5: Log out");
    print("-"*25);
    print("6: exit");
    print("-"*25);


    try{

      op = int.parse(stdin.readLineSync()!);


      switch(op){


        case 0 :

        print("\n######      what the book title?      ######\n");

        String title = stdin.readLineSync()!;

        print("\n######      what it is book categories?      ######\n");
        List<String> categoriesList = [];
        String catOp = "0";
whilecategories :
        while(true){

          print("\n");
    
    print("0: for add categories:"); 
    print("-"*25);
    print("1: exit form categories add ");
    print("-"*25);

     catOp = stdin.readLineSync()!;
    
          switch(catOp){

            

            case "0" :

            

            print("\n ##### give the name of the categories   ###### ");
            print("-"*25);

             String catName = stdin.readLineSync()!;

            
            categoriesList.add(catName);

            break;


            case "1":
            break whilecategories;

            

            default :
            print("\n######     eorr place chose 0 option or 1       ######\n");
            break;

          }

        }

        // finsh add categoriesList


        



        print("\n######      what it is book authors?      ######\n");
        List<String> authorsLis = [];
        String authOp = "0";
whileauthors :
        while(true){

          print("\n");
    
    print("0: for add authors:"); 
    print("-"*25);
    print("1: exit form authors add ");
    print("-"*25);
    authOp = stdin.readLineSync()!;
     

          switch(authOp){

            case "0" :

            print("\n ##### give the name of the authors   ###### ");
            print("-"*25);

            String authName = stdin.readLineSync()!;

           
            authorsLis.add(authName);

            break;


            case "1":
            break whileauthors;

            

            default :
            print("\n######     eorr place chose 0 option or 1       ######\n");

          }

        }

        // finsh add authorsLis


        
        int year = 0;

       whileYearBreak :
        while(true){
          print("\n ##### give the year of the book   ###### ");
          
          

          try{

            year = int.parse(stdin.readLineSync()!);

            break whileYearBreak;

          } catch(err){

            print("\n######     erorr only int no String      ######\n");


          }

        }

        // year done




         
        int quantity = 0;

       whilequeBreak :
        while(true){

          print("\n ##### give the quantity of the book   ###### ");
          
          

          try{

            quantity = int.parse(stdin.readLineSync()!);

            break whilequeBreak;

          } catch(err){

            print("\n######     erorr only int no String      ######\n");


          }

        }

        // quantity done




        
        double price = 0;

       whilePriceBreak :
        while(true){
           print("\n ##### give the price of the book   ###### ");
          
          

          try{

            price = double.parse(stdin.readLineSync()!);

            break whilePriceBreak;

          } catch(err){

            print("\n######     erorr only int no String      ######\n");


          }

        }

        library.addBook(title: title, authors: authorsLis, categories: categoriesList, year: year, quantity: quantity, price: price);

        break;


        case 1 :

        
       whileIdBreak :
        while(true){

          print("\n######   chose how you want serch the book       ######\n");

           print("0: id"); 
    print("-"*25);
    print("1: title");
    print("-"*25);

    try{

       op = int.parse(stdin.readLineSync()!);

    switch(op){

      case  0:
      print("\n######   give the book id      ######\n");

      int bookId = int.parse(stdin.readLineSync()!);


       library.removeBook(serch: bookId.toString(), idNot: false);

       break whileIdBreak;


       case 1 :

        print("\n######   give the book title     ######\n");

      String bookTitle = stdin.readLineSync()!;


       library.removeBook(serch: bookTitle, idNot: true);

       break whileIdBreak;



    }

    }catch(err){
      print("\n#####    eorr only int no string   #######\n");

    }

   

        }




       

        break;


        case 2 :

        library.buyBook();

        break;


        case 3 :

        library.displayReceipt();

        break;


        case 4 :

        library.addAdmin();
        

        break;

        


        case 5 :
        return false;


        case 6 :
        return true;


        default:
        print("######   chose one of the option   ######");
        break;

        


      }

      


    }catch(err){

      print("-"*25);

      print("######  plase give int number no String or double   ######");

      print("-"*25);

    }

    }

}