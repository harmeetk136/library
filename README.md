# library Management System
Overview
The Library Management System is designed to manage the inventory, loans, and reservations of a library's collection of books. The system consists of five main tables: Books, Authors, Members, Loans, and Reservations. Each table stores specific information relevant to the library's operations.
# Database Schema
#### Books Table: Stores information about books.
>•	  book_id (Primary Key)
>•	  title
>•	  author_id (Foreign Key referencing Authors)
>•    publication_year
>•	  genre
2. Authors Table: Stores information about book authors. 
>•	author_id (Primary Key)
>•	author_name
3. Members Table: Contains details of registered library members.
>•	member_id (Primary Key)
>•	member_name
>•	address
>•	email
>•	phone_number
4. Loans Table: Records books borrowed by members.
>•	loan_id (Primary Key)
>•	member_id (Foreign Key referencing Members)
>•	book_id (Foreign Key referencing Books)
>•	loan_date
>•	return_date
5. Reservations Table: Tracks book reservations by members.
>•	reservation_id (Primary Key)
>•	member_id (Foreign Key referencing Members)
>•	book_id (Foreign Key referencing Books)
>•	reservation_date

