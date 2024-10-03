# Telecom Express - Database

<img src="telecomexpressandsql.png" alt="telecomexpress" width="500"/>

## Project Overview
This project represents the relational database structure for **Telecom Express (TE)**, a telecommunications company offering various mobile plans such as SIM-only, phone contracts, and mobile broadband plans. The database aims to manage customer data, SIM card details, phone plans, billing, collections, and deactivations to ensure efficient management of Telecom Express's operations.

## Business Description
Telecom Express (TE) serves both individual customers and small businesses. The company offers mobile plans, including Pay As You Go (PAYG) and Bill Pay. Customer identity verification is essential for compliance with GDPR and fraud prevention. This database helps store and manage customer information, SIM card details, and plan specifications while ensuring the integrity of the system with rules and constraints.

## Entities and Relationships
The database includes the following entities, each representing a significant aspect of TE's business:

1. **Customer**: Stores customer details, including name, email, date of birth, and identification documents.
2. **CustomerSim**: Links customers to their respective SIM cards using customer ID and SIM serial number.
3. **SimDetails**: Manages SIM-specific details such as activation date, time, and SIM type.
4. **PhonePlanType**: Categorizes plans into SIM-only, phone contracts, and mobile broadband plans.
5. **Top-Up**: Tracks the top-up amounts and dates for PAYG customers.
6. **BillSpecifications**: Manages billing information, including bill amount, due date, and late fees.
7. **Collections**: Tracks late fee amounts and the date bills enter collections.
8. **Deactivation**: Manages deactivation details when SIM cards are not used for extended periods.

## ER Diagram
An ER (Entity-Relationship) diagram is included to illustrate the relationships between the different entities.

## Database Setup
### Prerequisites
Ensure you have the following installed:
- SQL Server or MySQL
- A compatible SQL client (e.g., MySQL Workbench, pgAdmin)

### SQL Schema and Setup
You can set up the database using the provided SQL script. The following tables are included:
- `Customer`
- `CustomerSim`
- `SimDetails`
- `PhonePlanType`
- `TopUp`
- `BillSpecifications`
- `Collections`
- `Deactivation`

### Sample Commands:
To create the **Customer** table:
```sql
CREATE TABLE Customer (
    simNumber VARCHAR(20) PRIMARY KEY NOT NULL,
    creditLevel INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    emailAddress VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    id_type VARCHAR(50) NOT NULL,
    id_number VARCHAR(50) NOT NULL
);
