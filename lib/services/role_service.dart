/*
*
* Role Service
* To check roles
*
* */
class RoleService {
  bool isAdmin(String role) => role.toLowerCase() == 'admin';

  bool isCustomer(String role) => role.toLowerCase() == 'customer';
}
