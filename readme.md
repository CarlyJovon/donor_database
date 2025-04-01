# Overview
The Donor Tracker Database is a PostgreSQL-based application designed to manage and track donations for a non-profit organization. It helps store and organize information related to donors, donation programs, and donations, making it easier for the organization to manage donor details, track program progress, and generate insightful reports about donations.

# Project Description
The Donor Tracker Database is intended to streamline the process of managing donations, donor information, and programs. By using PostgreSQL, the system provides efficient management and tracking of donor and program-related data. With this system, the organization can keep track of individual and organizational donations, analyze trends, and improve operational efficiency. The database is set up to allow easy querying, making it a useful tool for report generation and decision-making.

## Docker Setup 
This project uses Docker to run a PostgreSQL container that serves as the database for the donor tracking system. 


## Features
**Donor Management**: Store and manage information about individual and organizational donors, including contact details and preferences.

**Program Tracking**: Track various donation programs, including their budget, status, start/end dates, and description.

**Donation Tracking**: Record donations, including the amount, donation date, payment method, and whether the donation is recurring.

**Reporting**: Run SQL queries to gather insights about donations, donors, and programs, such as total donations per donor, program budgets, and donation history.

**Easy Setup**: Set up the database and start tracking donations quickly using Docker and PostgreSQL.


# Project Setup
## Prerequisites
- Docker: Required to run the PostgreSQL database container
- PyCharm:  (or any SQL client that supports PostgreSQL) for connecting to the database and running queries.
- Basic knowledge of SQL: To query and analyze data within the database

## How to Use the Database
1. Setup Database:

- Clone the repository (if applicable).

- Run `docker-compose up` in the project root directory to start the PostgreSQL container.

2. Connect to Database:

- Open your SQL client (e.g., PyCharm), and create a new connection: 
- Host: `localhost`
- Port: `5477`
- User: `admin`
- Password: `password`
- Database: `donor_tracker`

3. Query the Database:
- Once the tables are created and data is inserted, you can begin running SQL queries to analyze the data.
## Examples of Queries You Can Run:  
* List all donors and their contact information 
* List all programs with budgets over $10,000
* Calculate the total donation amount made by each donor
* Find the program that received the most donations
* View donations made in a specific year or by a particular donor
*  Find all programs with budgets above a certain threshold
