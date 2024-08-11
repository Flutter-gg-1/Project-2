
import 'dart:io';
import 'models/library.dart';
import 'models/library_data.dart';

void addBook(LibraryData books) {
  String? title;
  List<String> authors = [];
  List<String> categories = [];
  int? year;
  int? quantity;
  double? price;
  while (true) {
    print("Enter the details of the new book:");
    print("Title: ");
    title = stdin.readLineSync();
    if (title == null || title.isEmpty) {
      print("Title cannot be empty. Please enter a title.");
      continue; 
    }

    print("Authors (comma-separated): ");
    String? authorsString = stdin.readLineSync();
    authors = authorsString!.split(',');
    if (authors.any((author) => author.isEmpty)) {
      print("Author names cannot be empty. Please enter valid author names.");
      continue; 
    }

    print("Categories (comma-separated): ");
    String? categoriesString = stdin.readLineSync();
    categories = categoriesString!.split(',');
    if (categories.any((category) => category.isEmpty)) {
      print("Category names cannot be empty. Please enter valid category names.");
      continue; 
    }

    print("Year: ");
    String? yearString = stdin.readLineSync();
    year = int.tryParse(yearString!);
    if (year == null) {
      print("Year must be a valid number. Please enter a year.");
      continue; 
    }

    print("Quantity: ");
    String? quantityString = stdin.readLineSync();
    quantity = int.tryParse(quantityString!);
    if (quantity == null || quantity <= 0) {
      print("Quantity must be a positive number. Please enter a valid quantity.");
      continue; 
    }

    print("Price: ");
    String? priceString = stdin.readLineSync();
    price = double.tryParse(priceString!);
    if (price == null || price <= 0) {
      print("Price must be a positive number. Please enter a valid price.");
      continue; 
    }

    // data validated
    break;
  }

  Library newBook = Library(
    id: (books.library.length + 1).toString(), // Assign a new ID
    title: title,
    authors: authors,
    categories: categories,
    year: year,
    quantity: quantity,
    price: price,
  );

  // Add the new book to the libraryData
  books.library.add(newBook);

  print("Book added successfully!");
  stdin.readLineSync();
  
}