# Library System 📕📗📘

<img src='./media/header.jpg' alt='library'>

# 1. Overview 📖
Library system is a cli application that tracks customers shopping in the library, which can be helpful to know how many people likes some type of books.

# 2. Requirements ❓
The system is based on two stakeholders
- **Admin** : The person who is responsible for the library content by adding or removing books to/from the library.
- **Customer** : The person who reaches out the library to purchase a book and enjoy reading it.

# 3. Code and Implementation 💻
In this section, we will dive into the details of the implementation of classes and some important methods/functions

## 3.1 Menu
<img src='./media/menu.png' alt='menu page' style='border: 5px solid #1c1561;'>

<br>

The application menu is customized based on the type of user using the application, in our library system, we have 3 types of menus :
### 3.1.2 Guest Menu
The first menu to appear to whoever uses our system and it has 4 choices as follows :\
    1. **Sign in** : By providing a valid customer id, customers can sign in through this option.\
    2. **Sign up** : In this option, user can be a new customer of ours by entering his basic data.\
    3. **Enter as admin** : Admin will access the library through this option.\
    4. **EXIT** : closes the program


### 3.1.3 Customer Menu
This is the menu that appears to user after registration, where they are be able to do the following :
- **Display library Books** : this option will print all the available books in the library
- **Buy a Book** : customers can buy books through this option.
- **View Receipts** : customers can view their purchase history by choosing this option.
- **Sign out** : this will exit the customer mode and we'll go back to pre-regestration process.

### Admin Menu
This is the admin menu where rhey can access the content of the library by adding or removing books, their actions can summerize as follows :
- **Display library books** : this is the only option in common between customers and admin.
- **add a book to library** : this is where library gets updated with new books, the added books info and details are all filled by admin.
- **remove a book from library** : the opposite of the option above, where a book gets removed from the library.

**view all customers receipts** : this can provide an ultimate view of customers and their shopping behaviours.

## 3.2 Customer class
This is the class that represents a library customer, it has the following attributes :
    1. **customerId** : which is the identifier for customers and cannot be duplicated.
    2. **name** : the customer's name, it is used to view greet messages.
    3. **balance**
    4. **Receipts**

Functions ...
    1.
    2.

## 3.3 Admin page



# 4. Conclusion 🏁
