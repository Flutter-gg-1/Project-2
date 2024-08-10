# Dart Library Management CLI Application

A Dart-base CLI application to manage a Library with a collection of books. The original data is pre-defined in a JSON file which is parsed and saved into data models.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Created By](#created-by)

## Features

The applications has two user roles (Admin, Customer), and functionality is diffirent based on current user. 

- Admin Functions:
    - Add Book
    - Delete Book
    - View All Customer Reciepts
- Customer Functions:
    - Buy Book
    - View Recipets

## Installation

To install and run this application, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/amer266030/Project-2.git
    ```

2. **Run the application:**

    ```bash
    dart run bin/library_sys
    ```

## Usage

### General Info

- The app does not have an implemented authentication mechanism, but it has user selection from pre-defined user ids.
- The app does not have any Data Persistence mechanisms.

### Sign In

The app prompts for user selection by picking a user id from a list of users with different roles at app launch.

```bash
-----------------------------------
Select a USER ID from the list below to sign in.

((0, Mozart, admin), (1, Chopin, customer), (2, Beethoven, customer), (3, Liszt, customer))
-----------------------------------

0
 ```

 Entering 0 in the example above will select 'Mozart as the user.

### Viewing Instructions within the app

The Welcome message will ask you to enter 'i' to view instructions to understand basic app commands:

```bash
-----------------------------------
Current User: Mozart, Role: admin
Enter i for instructions
-----------------------------------

i
------------------------------
Common
--------
show |  View books
so   |  Sign out
q    |  Quit App
------------------------------
Admin
--------
add  |  Add Book
rm   |  Remove Book
vcr  |  View Customer Reciepts
------------------------------
Customer
--------
buy  |  Buy Book
vmr  |  View My Reciepts
-----------------------------
```

using the 'sign out' function will take you back to select another user.

### Privilaged Access Rights

Running Functions under the wrong user-role will give an 'Access Denied' message as shown below:

```bash
-----------------------------------
Current User: Mozart, Role: admin
Enter i for instructions
-----------------------------------

buy
🛑 Oops! You cannot run this function with the current user. 
 Try Signing in with a different user role 🛑
```

### Data Validation

Data Validation is performed when creating a new book

There are 7 fields for each employee that can be added/edited, which are:
- ID (Must be a whole number)
- Title (Cannot be empty)
- Categories (Selection from pre-defined categories)
- Authors (Cannot be empty)
- Price (Must be a whole number between 1800 and 2030)
- Quantity (Must be a whole number between 0 and 10000)
- Price (Must be a number, whole or decimal, between 0 and 2000)

Wrong Entry Example:

```bash
Adding a new Book
Enter cancel at anytime to exit this screen

example Input for ID: 1
Enter an ID number: 1
❌ Book with ID "1" already Exists!
example Input for ID: 1
Enter an ID number: a
❌ ERROR: Incorrect Entry for a number ID!
```

For the 'Book Categories' field, the app prompts for a number selection of pre-defined categories and does not require typing the name.

### Buying a Book

Only customer can buy books, but admins can view all thier reciepts.
The purchase is only done if the requrested quantity is available. 

Example of unsuccessful purchase:

```bash
Enter a book ID to buy it 2
How many number of copies do you want to purchase?
Enter Quantity 1
✅ Good Entry for Quantity
🛑 ❌ Not Enough Books for desired Quantity! 🛑
```

Example of successful purchase:

```bash
Enter a book ID to buy it 1
How many number of copies do you want to purchase?
Enter Quantity 2
✅ Good Entry for Quantity
✅ Purchase Successful!
```

### Viewing recipets

Customers can only view thier own recipets, but admins can view all reciepts. Recipet example:

```bash
Chopin Reciepts
---------------------------------------------------
Book title:                     The Great Gatsby
price:                          10.99 SAR
quantity:                       2
                            
total:                          21.98 SAR

Thank you for your purchase Chopin!
Happy Reading!
---------------------------------------------------
```

## Created By

- **Amer Alyusuf**
- [Personal Website](https://amer266030.github.io)
- [LinkedIn](https://www.linkedin.com/in/amer-alyusuf-77398587)
