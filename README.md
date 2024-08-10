# Project-2



### how the system build



- using muti model to handle json data
-  SystemModel class is used for to do most method in the system like add book and and store users data when new user signin or login



---

### method in the system 

- addBook() : is used for admin to add book in the system
- removeBook() : is used for admin to remove book by id or title the user will chose what he want
- buyBook() : it for admin and customer the book they buy will be saved in there UserModel class that will used later to show the receipt

-  displayReceipt() : will show all the Receipt that admin or customer buy 

- appRun() : here where system start will first ask user if he new in the system or arldy sign in then will show him based on if he admin or customer it own comand line

- adminComand() :it only for admin after the system check if he admin or not
- customerComand : only for customer will show up comand that just for customer

---

### Admin and customer Role

- admin can do all what customer can do plus can add book or Remove them or add new Admin by deult
there is admin user saved in the system that from it can add new admins

- customer can only buy book and show the receipt




