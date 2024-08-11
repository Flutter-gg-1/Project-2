# Library System Project 📚

This project implements a simple command-line library management system using Dart. Users can interact with the system as either an **Admin** or a **Customer**, performing various operations related to books.

## Project Structure

The project consists of:

- **`project2.dart`:** The entry point of the application, containg main function.
- **`start.dart`:** Present the main list of actions and handle user interactions and navigation
- **`models/library.dart`:** Defines the `Library` class representing a book in the library.
- **`models/library_data.dart`:** Defines the `LibraryData` class responsible for managing the list of books.
- **`dataset.dart`:** Contains the initial library data loaded from a JSON file.
- **`users_data.dart`:** Contains two lists representing customer data and receipts data.

As well as other functions files to for Signing up, logging in, adding and removing books, buying a book, printing receipts and viewing all receipts.

## Features

### Admin Features

- **Add Book:** Allows admins to add new books to the library, including details like title, authors, categories, publication year, quantity, and price.
- **Remove Book:** Enables admins to remove existing books from the library by specifying their unique ID.
- **View Receipts:** Provides admins with the ability to view receipts of all book purchases.

### Customer Features

- **Buy Book:** Allows customers to purchase available books by selecting the book's ID.
- **View Receipt:** Displays a receipt after purchasing a book, including details like the book's title and price.

## Data Persistence

The library data is stored in a JSON file (`library_data.json`). This file is loaded at the start of the application and updated whenever a book is added or removed.

## User Roles

- **Admin:** Can add and remove books and view all receipts.
- **Customer:** Can only buy books and view the receipt.

## Running the Application

1. **Clone the repository:**
   ```bash
   git clone <repository_url> ```
   
2. **Navigate to the project directory:**
   ```bash
  cd project2 ```

3. ** Run the application:**
   ```bash
  dart run ```
  
4. ** Navigate through the application and complete tasks**

### Please note 
This project is a basic implementation and may not cover all aspects of a real-world library management system.