# Bookstore Management System

## Overview
This is a simple command-line-based Bookstore Management System written in Dart. The system supports two types of users: Admin and Customer. The Admin can add, remove, and view books, as well as view purchase histories. The Customer can buy books and view their purchase receipts. The system is designed to manage a bookstore's inventory and handle book purchases.

## Features

### Admin
- **View All Books**: The Admin can view all books available in the bookstore.
- **Add Books**: The Admin can add new books to the bookstore by providing details such as ID, title, authors, categories, year of publication, quantity, and price.
- **Remove Books**: The Admin can remove books from the bookstore using the book ID.
- **View Purchase History**: The Admin can view the receipts of all book purchases made by customers.
- **Switch User**: The Admin can switch to the Customer mode.
- **Exit**: The Admin can exit the application.

### Customer
- **Buy a Book**: The Customer can purchase a book by providing the book ID. The system checks if the book is available in stock and then processes the purchase.
- **View All Books**: The Customer can view all available books in the bookstore.
- **View Receipts**: The Customer can view their purchase receipts.
- **Switch User**: The Customer can switch to the Admin mode.
- **Exit**: The Customer can exit the application.

## Files

- **main.dart**: The entry point of the application that handles user login, menu navigation, and interactions for both Admin and Customer.
- **admin.dart**: Defines the Admin class, which extends the Customer class and includes methods for viewing all books, adding books, removing books, and viewing purchase histories.
- **customer.dart**: Defines the Customer class, which includes methods for buying books, viewing all books, and viewing purchase receipts.
- **bookStore.dart**: Defines the BookStore class, which manages the library's book collection.
- **library.dart**: Defines the Library class, which represents individual books in the bookstore.
- **libdata.dart**: Contains the JSON data representing the initial set of books in the bookstore.

## How It Works

### Login
The user is prompted to enter a username and password. Depending on the credentials, the user is logged in as either an Admin or a Customer.

### Admin Menu
Once logged in as Admin, the user can view all books, add or remove books, view the purchase history, switch to another user, or exit the application.

### Customer Menu
Once logged in as a Customer, the user can buy books, view all books, view their receipts, switch to another user, or exit the application.

### Book Management
The Admin can manage the bookstore's inventory by adding new books or removing existing ones. The inventory is updated in real-time.

### Purchasing Books
The Customer can purchase books if they are available in stock. The purchase details are saved as a receipt and can be viewed later.

### View Receipts
Both Admin and Customer can view the receipts of purchases. The Admin can view all customer receipts, while the Customer can only view their own receipts.

### View App

1.0

![image](https://github.com/user-attachments/assets/8b8c84c9-ed05-4c74-ac05-32c73b229516)

1.1

### View ReceiCustomer Menu

![image](https://github.com/user-attachments/assets/e11901a8-68c6-4a97-9262-7a2c78f9d853)

1.2

### buy book

![image](https://github.com/user-attachments/assets/e8b87849-c1b7-4053-88d0-7ebc57e7f636)

1.3

### buy book error handling 
![image](https://github.com/user-attachments/assets/cba6c6f9-a8b0-45ce-ba00-f57cfa6a655e)

1.4

### buy book quantity checker

![image](https://github.com/user-attachments/assets/9462235f-d495-4b03-bf17-a2a76502cae8)


1.5
### view all books

![image](https://github.com/user-attachments/assets/7d39e1cb-23ff-4fd2-af2f-81c943313794)

1.7
### view Receipts
![image](https://github.com/user-attachments/assets/e2e9bbe8-29cf-4628-b547-940cc03b293e)

### view Receipts



1.8

### view Switch to another user

![image](https://github.com/user-attachments/assets/1a620313-e501-4069-83a9-7dee72170f4f)

2.0

### log in into admmin

![image](https://github.com/user-attachments/assets/4cc1a30f-3cb9-44ca-af15-44b441c7d032)

2.1

### View all library

![image](https://github.com/user-attachments/assets/d01797d4-97d5-4531-90b8-7d79faeca485)


2.2

### add new book with view 

![image](https://github.com/user-attachments/assets/218bd073-1acb-4306-b20f-32977f191053)

![image](https://github.com/user-attachments/assets/9b63e539-241c-4e6b-9d6a-eb9292a383c4)


2.4

### remove book

![image](https://github.com/user-attachments/assets/7e53d803-145e-4502-896e-325516d5c9e1)

![image](https://github.com/user-attachments/assets/d592329c-1030-4677-9e54-82380291144b)

if the book not found 

![image](https://github.com/user-attachments/assets/079862e1-6ab3-43cd-a3de-83b2422c3ff8)


2.5

### View purchase history

![image](https://github.com/user-attachments/assets/3d7b245c-f167-459b-8a43-ba63fb87699a)


2.5

### Exite

![image](https://github.com/user-attachments/assets/78ed3065-69d8-43dc-bf31-f0610de8c2d2)



