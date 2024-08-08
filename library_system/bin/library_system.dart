import 'model/library.dart';
import './data/jsonData.dart';

void main() {
  var x = Library.fromJson(jsonData);

  print(x.book.first.authors);
}
