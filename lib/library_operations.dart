void addBook(Map<String, dynamic> library, Map<String, dynamic> newBook) {
  library['library'].add(newBook);
  print("Book added successfully!");
}
