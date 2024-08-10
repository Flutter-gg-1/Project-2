class Receipt {
  int customerId;
  String customerName;
  String bookName;
  int quantity;
  double price;
  late double total;

  Receipt(
      {required this.customerId,
      required this.customerName,
      required this.bookName,
      required this.quantity,
      required this.price}) {
    total = quantity * price;
  }

  showReceipt() {
    print('''
\x1B[32m---------------------------------------------------\x1B[0m
Book title:                     \x1B[32m$bookName\x1B[0m
price:                          \x1B[32m$price SAR\x1B[0m
quantity:                       \x1B[32m$quantity\x1B[0m
                            
total:                          \x1B[32m$total SAR\x1B[0m

Thank you for your purchase \x1B[32m$customerName!\x1B[0m
Happy Reading!
\x1B[32m---------------------------------------------------\x1B[0m
''');
  }
}
