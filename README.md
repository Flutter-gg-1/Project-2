![My Image](./lib/images/img_Tuwaiq.png)

# Library System
this library system 

**Features:**
<li>can't buy book if quantity is 0
<li>try catch
<li>user and admin roll
<hr>

* User Authentication: Login as either admin or customer using predefined credentials.
* Admin Panel:
    * Add new books to the library.
    * Remove books from the library.
    * View purchase history from all customers.
    * View all books in the library.
* Customer Panel:
    * Purchase books (if available).
    * View personal purchase history.
    * View available books in the library.

**Dependencies:**

* dart:io: Provides standard input/output functionality.

**Running the Application:**

![My Image](./lib/images/sign-in.png)
* sign in panel will check if the user have admin roll or customer and will display his panel mode

![My Image](./lib/images/account-roll.png)
* the main account only tow admin and a customer in future it will be more efficient

![My Image](./lib/images/admin-mode.png)
* admin can do these operation and contain try catch 


![My Image](./lib/images/add-error-msg.png)
* if the admin add a book most fill all the information other wise it will continue the add if not it will be loop until fill it

![My Image](./lib/images/add-msg2.png)
* same goes here most fill a numric data only to continue


![My Image](./lib/images/remove-book.png)
* to remove a book you need to write the id of book 

![My Image](./lib/images/customer-mode.png)
* customer mode can do: buying \ print receipt \ display book to choose on of them

![My Image](./lib/images/buy-book.png)
* if the customer enter a wrong id it will show msg color

![My Image](./lib/images/display-book-customer.png)
* here i display the books and choose id 13 to buy it

![My Image](./lib/images/purchase.png)
* purchase is success

![My Image](./lib/images/receipt.png)
* the reciept for customer and admin

![My Image](./lib/images/quantity.png)
* after purchased the quantity decrease by 1

**Code Structure:**
![My Image](./lib/images/main-do.png)
* roll for users admin and customer

