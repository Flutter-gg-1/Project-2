enum BookCategories {
  fiction('Fiction'),
  dystopian('Dystopian'),
  sciFi('Science Fiction'),
  romance('Romance'),
  classical('Classic');

  final String _text;

  const BookCategories(this._text);

  @override
  String toString() => _text;
}

extension BookCatExtension on BookCategories {
  String get number {
    switch (this) {
      case BookCategories.fiction:
        return '1';
      case BookCategories.dystopian:
        return '2';
      case BookCategories.sciFi:
        return '3';
      case BookCategories.romance:
        return '4';
      case BookCategories.classical:
        return '5';
    }
  }
}
