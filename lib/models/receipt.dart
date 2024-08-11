class Receipt {
  final String receiptId;
  final String bookTitle;
  final double price;
  final DateTime purchaseDate;

  Receipt({
    required this.receiptId,
    required this.bookTitle,
    required this.price,
  }) : purchaseDate = DateTime.now();

  // Factory constructor for creating a Receipt instance from JSON.
  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      receiptId: json['receiptId'] as String,
      bookTitle: json['bookTitle'] as String,
      price: json['price'] as double,
    );
  }

  // Convert a Receipt instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'receiptId': receiptId,
      'bookTitle': bookTitle,
      'price': price,
      'purchaseDate': purchaseDate.toIso8601String(),
    };
  }
}
