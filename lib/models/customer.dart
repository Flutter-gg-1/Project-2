// class to represent customer
class Customer {
  final int customerId;
  final String name;
  double balance;

  Customer({required this.customerId, required this.name, required this.balance});

  set setBalance(double newBalance) {
    balance = newBalance;
  }

  get getBalance {
    return balance;
  }

  buyBook(List<Map<String,dynamic>> library, String bookName) {
    for(var book in library) {
      if(book['title'] == bookName) {
        setBalance = balance - book['price'];
      }
    }
  }
}