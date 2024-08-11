class User {
  // If admin return true if costmur return false if the rols input is wrong throw an error
  static bool checkRole(String role) {
    // Admin
    if (role.toLowerCase().trim() == 'admin') {
      return true;
    } else if (role.toLowerCase().trim() == 'customer') {
      return false;
    } else {
      throw Exception('Wrong Role !');
    }
  }
}
