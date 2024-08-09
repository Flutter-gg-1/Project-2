enum BookCategory {
  fiction('Fiction'),
  dystopian('Dystopian'),
  sciFi('Science Fiction'),
  romance('Romance'),
  classical('Classic');

  final String _text;

  const BookCategory(this._text);

  @override
  String toString() => _text;

  static void showAll() {
    print('📚 Book Categories');

    for (var cat in values) {
      print('${cat.number} - ${cat.toString()}');
    }
  }
}

extension BookCatExtension on BookCategory {
  String get number {
    switch (this) {
      case BookCategory.fiction:
        return '1';
      case BookCategory.dystopian:
        return '2';
      case BookCategory.sciFi:
        return '3';
      case BookCategory.romance:
        return '4';
      case BookCategory.classical:
        return '5';
    }
  }

  static String getName(String catNum) {
    switch (catNum) {
      case '1':
        return BookCategory.fiction.toString();
      case '2':
        return BookCategory.dystopian.toString();
      case '3':
        return BookCategory.sciFi.toString();
      case '4':
        return BookCategory.romance.toString();
      case '5':
        return BookCategory.classical.toString();
      default:
        return BookCategory.classical.toString();
    }
  }
}
