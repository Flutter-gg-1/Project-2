import 'Models/library.dart';
import 'data_set.dart';

void main(List<String> arguments) {
  Library library = Library.fromJson(data);

  print(library.toJson());
}
