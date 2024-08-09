import '../model/book_categories.dart';
import 'home.dart';

extension HomeVerifictionFuncs on Home {
  bool verifyID(String str) {
    try {
      var _ = int.parse(str);
      var book = library.books.where((book) => book.id! == str).firstOrNull;
      if (book != null) {
        print('❌ Book with ID "$str" already Exists!');
        return false;
      } else {
        print('✅ Good Entry for ID');
        return true;
      }
    } catch (_) {
      print('❌ ERROR: Incorrect Entry for a number ID!');
      return false;
    }
  }

  bool verifyTitle(String str) {
    if (str.isEmpty) {
      print('❌ Book title connot be empty');
      return false;
    } else {
      print('✅ Good Entry for Title');
      return true;
    }
  }

  bool verifyAuthors(String str) {
    List<String> arr = str.split(',');
    if (arr.isEmpty) {
      print('❌ You must enter at least one author');
      return false;
    } else {
      for (var author in arr) {
        if (author.isEmpty) {
          print('❌ Author name cannot be empty');
          return false;
        }
      }
      print('✅ Good Entry for Authors');
      return true;
    }
  }

  bool verifyCategories(String str) {
    var catNumbers = BookCategory.values.map((e) => e.number).toList();

    List<String> arr = str.replaceAll(' ', '').split(',');
    if (arr.isEmpty) {
      print('❌ You must enter at least one catogory');
      return false;
    } else {
      for (var cat in arr) {
        if (!catNumbers.contains(cat)) {
          print('❌ Category $cat does not exist!');
          return false;
        }
      }
      print('✅ Good Entry for Categories');
      return true;
    }
  }

  bool verifyYear(String str) {
    try {
      var year = int.parse(str);
      if (year < 1800 || year > 2030) {
        print('❌ Year must be between 1800 & 2030');
        return false;
      } else {
        print('✅ Good Entry for Year');
        return true;
      }
    } catch (_) {
      print('❌ ERROR: Incorrect number entry for a Year!');
      return false;
    }
  }

  bool verifyQuantity(String str) {
    try {
      var quantity = int.parse(str);
      if (quantity < 0 || quantity > 10000) {
        print('❌ Quantity must be between 0 & 10000');
        return false;
      } else {
        print('✅ Good Entry for Quantity');
        return true;
      }
    } catch (_) {
      print('❌ ERROR: Incorrect number entry for Quantity!');
      return false;
    }
  }

  bool verifyPrice(String str) {
    try {
      var price = double.parse(str);
      if (price < 0 || price > 2000) {
        print('❌ Price must be between 0 & 2000');
        return false;
      } else {
        print('✅ Good Entry for Price');
        return true;
      }
    } catch (_) {
      print('❌ ERROR: Incorrect number entry for Price!');
      return false;
    }
  }
}
