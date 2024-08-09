# Library System Project 📚

Welcome to the **Library System Project**! This command-line application, built with Dart, allows users to manage a library system by performing various operations based on their role: **Admin** or **Customer**.

## Installation

1. **Install Dart**: Ensure Dart is installed on your system. You can download it from [Dart's official website](https://dart.dev/get-dart).
2. **Clone the Repository**:
    ```bash
    git clone https://github.com/turki-aloufi/Project-2.git
    ```
3. **Navigate to the Project Directory**:
    ```bash
    cd Project-2
    ```

## Usage

1. **Run the Application**:
    ```bash
    dart run
    ```

## Dataset

- The application uses a JSON dataset stored in `bin/data_set.dart`.

## Project Structure

### Models

- **`Library`**: Manages a collection of `Book` objects and a shopping cart (`List<BookOrder>`). It provides various methods for interacting with the books and the cart.
- **`Book`**: Represents a book in the system with attributes like `id`, `title`, `categories`, `price`, etc.

### Classes

- **`BookOrder`**: Represents an order, containing a `Book` object and the quantity ordered. It is used to populate the cart.
- **`Receipt`**: Represents a purchase receipt, containing an `id`, a `cart` (list of `BookOrder` objects), and the total price. It also includes a `printReceipt()` method for printing the receipt.

### Other Files

- **`admin.dart`**: Contains the `printAdminUi()` function, which displays the admin options and includes error handling.
- **`customer.dart`**: Contains the `printCustomerUi()` function, which displays the customer options and includes error handling.

## System Overview

Upon running the system, the user is prompted to select their role: Admin or Customer.

### Main Menu

![Welcome Message](image.png)

- **1 - Admin**: Opens the admin interface.
- **2 - Customer**: Opens the customer interface.
- **0 - Exit**: Closes the system.

### Admin Interface

If the user selects the admin role, they can perform the following operations:

![Admin Menu Interface](image-1.png)

- **1 - Print All Books**: Displays all books in the system.
- **2 - Add Book**: Prompts the user to enter book details to add it to the system.
- **3 - Remove Book**: Removes a book by its `id`.
- **4 - Get All Receipts**: Retrieves all customer purchase receipts (empty until purchases are made by customers).
- **0 - Exit**: Returns to the main menu.

### Customer Interface

If the user selects the customer role, they can perform the following operations:

![Customer Menu Interface](image-2.png)

- **1 - Print All Books**: Displays all books in the system.
- **2 - Add Book to Cart**: Prompts the user to enter the book `id` and `quantity` to add it to their cart.
- **3 - Remove Book from Cart**: Removes a book from the cart by its `id`.
- **4 - View My Cart**: Displays all books in the cart along with the total price.
- **5 - Checkout and Print Receipt**: Generates and prints a receipt with the `id`, `cart`, and `total` price, and adds the receipt to the list of receipts viewable by the admin.
- **0 - Exit**: Returns to the main menu.
