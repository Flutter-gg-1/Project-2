import 'library_manager/admin.dart';
import 'library_manager/customer.dart';
import 'library_manager/library_manager.dart';
import 'model/book.dart';
import 'model/user.dart';

void main() {
  final mgr = LibraryManager();

  var admin1 = User(name: 'Superman', age: 35, userRole: UserRole.admin);
  var customer1 = User(name: 'Harry', age: 15);
  var customer2 = User(name: 'Brenda', age: 33);

  mgr.addBook(Book(
      id: '99',
      title: 'Book of life',
      authors: ['ABC', 'XYZ'],
      categories: ['comedy'],
      year: 2024,
      quantity: 25,
      price: 15.43));

  // mgr.removeBook(mgr.books.first);

  // mgr.showAllBooks();

  mgr.buyBook(customer: customer1, bookId: '1', quantity: 2);
  mgr.buyBook(customer: customer2, bookId: '3', quantity: 2);
  // mgr.viewReciepts(customer: customer1);
  // mgr.showAllReciept();
}
