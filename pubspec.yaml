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
