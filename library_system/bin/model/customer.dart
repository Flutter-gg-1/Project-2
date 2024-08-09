class Customers {
  List<Customer> customer;

  Customers({required this.customer});

  factory Customers.fromJson(Map<String, dynamic> json) {
    return Customers(
        customer: json["customers"].map<Customer>((element) {
      return Customer.fromJson(element);
    }).toList());
  }
}

class Customer {
  int id;
  String name;
  String phone;
  String? username;
  String? password;
  int? role;

  Customer(
      {required this.id,
      required this.name,
      required this.phone,
      this.username,
      this.password,
      this.role});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        role: json["role"]);
  }
}
