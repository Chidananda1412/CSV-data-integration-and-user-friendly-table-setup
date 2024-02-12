# Annual Enterprise Survey Database

This repository contains a project for managing and analyzing annual enterprise survey data using a MySQL database. The project includes scripts for creating a database, importing data from CSV files, and performing various queries to analyze the financial data.

## Table of Contents

- [Getting Started](#getting-started)
- [Database Schema](#database-schema)
- [Usage](#usage)
- [Queries](#queries)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

To get started with this project, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have MySQL installed on your system.
3. Run the SQL scripts provided in the `sql` directory to create the database schema and import data from CSV files.
4. Use MySQL client or any preferred tool to interact with the database and execute queries.

## Database Schema

The database schema consists of a single table named `FinancialData`. Here are the attributes of the table:

- `id`: Primary key, auto-incremented unique identifier for each record.
- `year`: Year of the financial data.
- `industry_code_ANZSIC`: Industry code according to ANZSIC classification.
- `industry_name_ANZSIC`: Name of the industry according to ANZSIC classification.
- `rme_size_grp`: Size group of the reporting unit.
- `variable`: Type of financial variable.
- `value`: Value of the financial variable.
- `unit`: Unit of measurement for the value.

## Usage

To use this project, follow the steps mentioned in the "Getting Started" section. Once you have set up the database and imported data, you can start querying the database to analyze the financial data.

## Queries

The project includes a variety of user-friendly queries to interact with the database and perform data analysis. These queries include:

- Basic retrieval queries to fetch data from the `FinancialData` table.
- Aggregation queries to calculate total, average, minimum, and maximum values for financial variables.
- Filtering queries to retrieve data based on specific criteria such as industry, year, size group, etc.
- Modification queries to update or delete existing records.
- Database management queries to alter table structure, add indexes, etc.

You can refer to the `queries.sql` file for a comprehensive list of queries provided with this project.


