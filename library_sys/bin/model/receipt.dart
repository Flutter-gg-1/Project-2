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
---------------------------------------------------
Book title:                     $bookName
price:                          $price SAR
quantity:                       $quantity
                            
total:                          $total SAR

Thank you for your purchase $customerName!
Happy Reading!
---------------------------------------------------
''');
  }
}
