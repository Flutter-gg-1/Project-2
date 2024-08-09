class User {
  String id;
  String firstName;
  String lastName;
  String password='';
  static List<User> usersList=[];

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.password
  });


}
