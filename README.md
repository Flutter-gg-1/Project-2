# Library System Project 📚

Welcome to the Library System Project! This project involves creating a command-line application in Dart to manage a library. The system will allow users to perform various operations based on their role: Admin or Customer.

## System features

### Administrator:
1. **Add books and details:**
- Book title.
- List of authors.
- List of book categories.
- Price.
- Available quantity.

2. **View information:**
- View all books available in the library.
- View all customer purchases.

3. **Delete book:**
- Remove a book from the library using its identification number.

### User:
1. **Registration and login:**
- Ability to create an account and log in.

2. **View books:**
- View all books in the library with available quantities and prices.

3. **Purchase books:**
- Purchase a book using its identification number and specify the required quantity.

4. **View purchases:**
- View all purchases made by the user.


## SAMPLE OUTPUT

### ADD BOOK - REMOVE BOOK - BUY BOOK
![image1](https://i.ibb.co/VgChm6T/image.png)

### ALL CUSTOMERS PURCHASES

![image2](https://i.ibb.co/WWvJr9r/Screenshot-32.png)




## JSON Data Structure
The library data is stored in a JSON format with the following structure:
```
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
    },
    {
      "id": "3",
      "title": "1984",
      "authors": ["George Orwell"],
      "categories": ["Dystopian", "Science Fiction"],
      "year": 1949,
      "quantity": 3,
      "price": 15.49
    },
    {
      "id": "4",
      "title": "Pride and Prejudice",
      "authors": ["Jane Austen"],
      "categories": ["Romance", "Classic"],
      "year": 1813,
      "quantity": 4,
      "price": 8.99
    },
    {
      "id": "5",
      "title": "The Catcher in the Rye",
      "authors": ["J.D. Salinger"],
      "categories": ["Fiction"],
      "year": 1951,
      "quantity": 2,
      "price": 13.49
    }
  ]
}

```
