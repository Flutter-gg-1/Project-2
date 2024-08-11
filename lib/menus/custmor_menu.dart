import 'dart:io';

void custmorMenu() {
  print('Admin menu:');
  while (true) {
    print('Menu:');
    print('1. Add a Book');
    print('2. Remove a Book');
    print('3. Buy a Book');
    print('4. Display Receipt');
    print('5. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter book title: ');
        String? title = stdin.readLineSync();
        stdout.write('Enter book price: ');
        double? price = double.tryParse(stdin.readLineSync() ?? '');

        // TODO complete integration -_-
        if (title != null && price != null) {
        } else {
          print('Invalid input.');
        }
        break;
      case '2':
        stdout.write('Enter book title to remove: ');
        String? title = stdin.readLineSync();

        // TODO complete integration -_-
        if (title != null) {
        } else {
          print('Invalid input.');
        }
        break;
      case '3':
        stdout.write('Enter book title to buy: ');
        String? title = stdin.readLineSync();

        // TODO complete integration -_-
        if (title != null) {
        } else {
          print('Invalid input.');
        }
        break;
      case '4':
        // TODO complete integration -_-
        break;
      case '5':
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

// Can buy books if they are available.
// Can view the receipt for their purchase.
