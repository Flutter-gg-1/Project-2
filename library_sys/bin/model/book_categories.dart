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

  BookCategory getName(String catNum) {
    switch (catNum) {
      case '1':
        return BookCategory.fiction;
      case '2':
        return BookCategory.dystopian;
      case '3':
        return BookCategory.sciFi;
      case '4':
        return BookCategory.romance;
      case '5':
        return BookCategory.classical;
      default:
        return BookCategory.classical;
    }
  }
}
