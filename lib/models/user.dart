// class to represent user
class User {
  final int userId;
  final String name;
  double balance;

  User({required this.userId, required this.name, required this.balance});

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