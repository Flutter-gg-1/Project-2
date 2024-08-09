import 'library.dart';
import 'data.dart';
void main(List<String> arguments) {

Library lib = Library.fromJson(data);

print(lib.toJson());

lib.buyBook('1');
print(lib.toJson());
  
}
