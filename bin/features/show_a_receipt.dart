// Implement Operations : Display Receipt: Develop a function to display a receipt for the purchased books.
import '../core/all_file.dart';
void showReceipt() {
  print('\n___________________#### Receipt ####__________________\n');
  if (purchaseINFO.isEmpty) {
    print('No book purchased yet.');
  } else {
    print('Book Purchased:');
    for (var element in purchaseINFO) {
      print(element);
    }
  }
  showPrompt(); 
}