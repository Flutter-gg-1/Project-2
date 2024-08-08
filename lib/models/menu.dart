// function to print menu based on mode
void menu({required String mode}) {
  if (mode == 'guest') {
    print('-' * 30);
    print("| Welcome To Yaser's Library |");
    print('-' * 30);
    print('| 1 |         Sign in        |');
    print('-' * 30);
    print('| 2 |         Sign up        |');
    print('-' * 30);
    print('| 3 |      Enter as Admin    |');
    print('-' * 30);
    print('| 0 |           EXIT         |');
    print('-' * 30);
  }
  if(mode == 'customer') {
    print('1 -> display library books');
    print('2 -> add a book to cart');
    print('3 -> display cart');
    print('4 -> purchase all books in cart');
    print('0 -> EXIT');
  }
  if(mode == 'admin') {
    print('1 -> display library books');
    print('2 -> add a book to library');
    print('3 -> remove a book from library');
    print('0 -> EXIT');
  }
}
