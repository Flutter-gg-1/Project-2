
# Library System Project 📚

Welcome to the **Library System Project**! This project is a command-line application built in Dart designed to manage a library system efficiently. It provides functionalities for both Admins and Customers.

## 🎯 Project Overview

This application empowers users with the following features:

- **Add New Books**: Seamlessly introduce new titles to the library’s collection.
- **Remove Existing Books**: Efficiently remove books that are no longer needed.
- **Purchase Available Books**: Easily buy books that are currently in stock.
- **Generate Receipts**: Instantly create and view detailed receipts for all transactions.

## 📂 JSON Data Structure

The library data is organized in a JSON format. Here are examples of two books from the library. Note that these are just examples, and the library contains additional books.

```json
{
  "library": [
    {
      "id": "1",
      "title": "The Great Gatsby",
      "authors": ["F. Scott Fitzgerald"],
      "categories": ["Fiction"],
      "year": 1925,
      "quantity": 5,
      "price": 10.99
    },
    {
      "id": "2",
      "title": "To Kill a Mockingbird",
      "authors": ["Harper Lee"],
      "categories": ["Fiction", "Classic"],
      "year": 1960,
      "quantity": 0,
      "price": 12.99
    }
    // More books are available in the library.
  ]
}
```

## 🖥️ Sample Outputs
###  ⚪️ Menu
<img width="454" alt="Screenshot 2024-08-11 at 1 31 10 AM" src="https://github.com/user-attachments/assets/87eef17f-e1c0-47a4-abb6-b231cb50f68f">

## ▫️ Admin Menu
### - Admin prees 1
<img width="454" alt="Screenshot 2024-08-11 at 1 31 26 AM" src="https://github.com/user-attachments/assets/9b066d8d-5eae-472f-8d2b-5d24967e3412">

### ◽️ Function for Admin 

#### * The admin presses 1 to add a book.

<img width="454" alt="Screenshot 2024-08-11 at 1 33 21 AM" src="https://github.com/user-attachments/assets/00de39fa-7fe1-4290-8fc0-51357730e38a">

 #### * The admin presses 2 and all the books appear.

<img width="454" alt="Screenshot 2024-08-11 at 1 34 05 AM" src="https://github.com/user-attachments/assets/730e236b-3fe6-4882-a500-4e36a77aa71f">


 #### * The admin presses 3 can removed  book.
<img width="454" alt="Screenshot 2024-08-11 at 1 34 43 AM" src="https://github.com/user-attachments/assets/ae9553de-7960-4777-bd9b-ba3a08ab2fd7">


####  * The admin presses 4 can see the receipts.

<img width="454" alt="Screenshot 2024-08-11 at 1 36 14 AM" src="https://github.com/user-attachments/assets/23a4dd17-3841-42d9-afc8-297dba1a129d">

 #### ........................................................................................................
 
##  ▫️ Customer Menu

### - Customer prees 2 
<img width="374" alt="Screenshot 2024-08-11 at 1 55 47 AM" src="https://github.com/user-attachments/assets/0744e9f4-d389-4f52-8269-9836179214b4">

### ▫️ Function for Customer 

 #### * The customer presses 1 and all the books appear. 

<img width="405" alt="Screenshot 2024-08-11 at 1 56 08 AM" src="https://github.com/user-attachments/assets/f8d8cc7f-7d8a-49bb-b4bb-9ddeae15ef79">

 #### * The customer presses 2 for Buy books.

<img width="401" alt="Screenshot 2024-08-11 at 2 58 38 AM" src="https://github.com/user-attachments/assets/4a947321-ec5b-44b5-bad0-cfe4898c9e77">

 #### * The customer presses 3 can see the receipts.
<img width="405" alt="Screenshot 2024-08-11 at 1 57 13 AM" src="https://github.com/user-attachments/assets/325c6fe3-251b-4e7f-aeed-5f2ac3da92a3">

###### Here in this case, if the customer bought two books of the same type, but the quantity is more than one.
 
<img width="405" alt="Screenshot 2024-08-11 at 1 57 49 AM" src="https://github.com/user-attachments/assets/36f4b21e-074e-409e-86e1-72baacc23924">

 ## 🛠️ Error Handling
Effective error handling is crucial for a robust application. Below are some common error scenarios
##### -1 If the admin enters a number that is not in the list.
<img width="382" alt="Screenshot 2024-08-11 at 2 42 25 AM" src="https://github.com/user-attachments/assets/2a79aac9-99aa-482a-80de-abd2ee19b024">

##### -2 If the customer enters a number that is not in the list.
<img width="382" alt="Screenshot 2024-08-11 at 2 42 04 AM" src="https://github.com/user-attachments/assets/512066be-10e4-4df8-b2ef-f92caa21810e">

##### -3  If the admin did not fill in the fields correctly.
<img width="518" alt="Screenshot 2024-08-11 at 2 41 41 AM" src="https://github.com/user-attachments/assets/601da8b2-f835-4c94-8ff7-c20e376cf70b">

##### -4 Here admin want add book but the id of book adding is existing .
<img width="454" alt="Screenshot 2024-08-11 at 1 31 46 AM" src="https://github.com/user-attachments/assets/80441482-fc17-4366-ba4c-36cbd6bc8503">

 ##### -5 Here admin wants to delete a book but this book does not exist.

<img width="454" alt="Screenshot 2024-08-11 at 1 34 29 AM" src="https://github.com/user-attachments/assets/772ee370-ff9e-4a85-9f3f-4032f86a817f">

##### -6 Here admin wants to see all Receipt but no purchase has been made yet.
<img width="454" alt="Screenshot 2024-08-11 at 1 35 00 AM" src="https://github.com/user-attachments/assets/8dfc3f7c-b1c9-4604-b3ac-c58801990706">


 ##### -7 Here customer wants to Buy but the book is not available.
 
<img width="401" alt="Screenshot 2024-08-11 at 2 59 06 AM" src="https://github.com/user-attachments/assets/646a4b24-0575-4218-a3ea-588879b7ba73">

 ##### -8 Here customer wants to Buy but the quantity of the book is sold out.
 <img width="401" alt="Screenshot 2024-08-11 at 2 59 16 AM" src="https://github.com/user-attachments/assets/f4907ebb-e721-42c3-8863-1a5fb9638e8d">


## 📝 Conclusion

The Library System is designed to streamline library management:

- **Admins** 🛠️: Efficiently manage books and view transaction receipts.
- **Customers** 💳: Easily purchase books and track their purchases with receipts.

thanks 🙏 🌺






