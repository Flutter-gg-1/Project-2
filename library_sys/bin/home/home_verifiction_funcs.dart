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
    var catNumbers = BookCategories.values.map((e) => e.number).toList();

    List<String> arr = str.split(',');
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
    return true;
  }

  bool verifyQuant(String str) {
    return true;
  }

  bool verifyPrice(String str) {
    return true;
  }

  bool isNumeric(String str) => double.tryParse(str) != null;
}
