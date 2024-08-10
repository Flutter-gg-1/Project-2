class User {
  String id;
  String name;
  String password;
  String role;
  List<Map<String, dynamic>> purchase = [];
  User(
      {required this.id,
      required this.name,
      required this.password,
      required this.role});
}
