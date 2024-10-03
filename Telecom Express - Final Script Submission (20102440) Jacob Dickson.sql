/*

  ______     __                             ______                              
 /_  __/__  / /__  _________  ____ ___     / ____/  ______  ________  __________
  / / / _ \/ / _ \/ ___/ __ \/ __ `__ \   / __/ | |/_/ __ \/ ___/ _ \/ ___/ ___/
 / / /  __/ /  __/ /__/ /_/ / / / / / /  / /____>  </ /_/ / /  /  __(__  |__  ) 
/_/  \___/_/\___/\___/\____/_/ /_/ /_/  /_____/_/|_/ .___/_/   \___/____/____/  
                                                  /_/           

By JACOB DICKSON
*/


/*

  _           _        ___ ______            _______    _     _           
 | |         | |      / _ \____  |          |__   __|  | |   | |          
 | |     __ _| |__   | | | |  / /   ______     | | __ _| |__ | | ___  ___ 
 | |    / _` | '_ \  | | | | / /   |______|    | |/ _` | '_ \| |/ _ \/ __|
 | |___| (_| | |_) | | |_| |/ /                | | (_| | |_) | |  __/\__ \
 |______\__,_|_.__/   \___//_/                 |_|\__,_|_.__/|_|\___||___/
                                                                          
									
Creating Normalisation Statement (1NF, 2NF, and 3NF).
creating tables in MySQL Workbench and inserting data.
*/


CREATE TABLE Customer (
    simNumber VARCHAR(20) PRIMARY KEY,
    creditLevel INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    emailAddress VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    id_type VARCHAR(50) NOT NULL,
    id_number VARCHAR(50) NOT NULL
);


CREATE TABLE CustomerSim (
    customerID VARCHAR(20),
    simSerialNo VARCHAR(20),
    PRIMARY KEY (customerID, simSerialNo),
    FOREIGN KEY (customerID) REFERENCES Customer(simNumber)
);


CREATE TABLE SimDetails (
    simSerialNo VARCHAR(20) PRIMARY KEY,
    activationDate DATE NOT NULL,
    activationTime TIME NOT NULL,
    simType VARCHAR(50) NOT NULL,
    restrictionType VARCHAR(50)
);

CREATE TABLE PhonePlanType (
    simSerialNo VARCHAR(20) PRIMARY KEY,
    simOnly BOOLEAN,
    phoneContract BOOLEAN,
    mobileBroadband BOOLEAN,
    FOREIGN KEY (simSerialNo) REFERENCES SimDetails(simSerialNo)
);

CREATE TABLE TopUp (
    topUpAmount DECIMAL(10, 2) NOT NULL,
    topUpDate DATE NOT NULL,
    simSerialNo VARCHAR(20),
    PRIMARY KEY (topUpDate, simSerialNo),
    FOREIGN KEY (simSerialNo) REFERENCES SimDetails(simSerialNo)
);

CREATE TABLE BillSpecifications (
    mobilePlan VARCHAR(50) NOT NULL,
    billAmount DECIMAL(10, 2) NOT NULL,
    dueDate DATE NOT NULL,
    lateFeeDate DATE,
    lateFee DECIMAL(10, 2),
    simSerialNo VARCHAR(20),
    PRIMARY KEY (simSerialNo),
    FOREIGN KEY (simSerialNo) REFERENCES SimDetails(simSerialNo)
);

CREATE TABLE Deactivation (
    topUpDate DATE NOT NULL,
    activationDate DATE NOT NULL,
    simSerialNo VARCHAR(20),
    PRIMARY KEY (simSerialNo),
    FOREIGN KEY (simSerialNo) REFERENCES SimDetails(simSerialNo)
);

CREATE TABLE Collections (
    lateFeeAmount DECIMAL(10, 2) NOT NULL,
    lateFeeDate DATE NOT NULL,
    simSerialNo VARCHAR(20),
    PRIMARY KEY (lateFeeDate, simSerialNo),
    FOREIGN KEY (simSerialNo) REFERENCES BillSpecifications(simSerialNo)
);






/*

  _           _        ___   ___             _____ _   _  _____ ______ _____ _______ 
 | |         | |      / _ \ / _ \           |_   _| \ | |/ ____|  ____|  __ \__   __|
 | |     __ _| |__   | | | | (_) |  ______    | | |  \| | (___ | |__  | |__) | | |   
 | |    / _` | '_ \  | | | |> _ <  |______|   | | | . ` |\___ \|  __| |  _  /  | |   
 | |___| (_| | |_) | | |_| | (_) |           _| |_| |\  |____) | |____| | \ \  | |   
 |______\__,_|_.__/   \___/ \___/           |_____|_| \_|_____/|______|_|  \_\ |_|   
                                                                                     
																		
Insert data for each table, approx 6 rows will
 be sufficient in each table for queries and
 having results show for you.
*/


INSERT INTO Customer (simNumber, creditLevel, name, emailAddress, dateOfBirth, id_type, id_number) 
VALUES 
('0000000001', 545, 'Jacob Dickson', 'jacobdickson@email.com', '2004-10-25', 'Driver License', 'AB123456'),
('0000000002', 628, 'Jason Carolan', 'jasoncarolan@email.com', '1999-02-15', 'Passport', 'AB123457'),
('0000000003', 320, 'Laura Fletcher', 'laurafletcher@email.com', '2000-08-14', 'Passport', 'AB123458'),
('0000000004', 400, 'Eric Blount', 'ericblount@email.com', '2003-09-13', 'Driver License', 'AB123459'),
('0000000005', 460, 'Lukas Smith', 'lukassmith@email.com', '1998-11-18', 'Driver License', 'AB123450'),
('0000000006', 700, 'Richal Picar', 'richalpicar@email.com', '2001-05-17', 'Passport', 'AB123451');

INSERT INTO CustomerSim (customerID, simSerialNo)
VALUES 
('SIM12345', '89443012345'),
('SIM12345', '89443012346'),
('SIM12345', '89443012347'),
('SIM12345', '89443012348'),
('SIM12345', '89443012349'),
('SIM12345', '89443012340');


INSERT INTO SimDetails (simSerialNo, activationDate, activationTime, simType, restrictionType)
VALUES 
('89443012345', '2022-01-15', '12:00:00', 'Prepay', NULL),
('89443012346', '2016-02-10', '14:30:00', 'Monthly', NULL),
('89443012347', '2014-09-10', '10:45:00', 'Monthly', 'Limited'),
('89443012348', '2015-04-05', '09:15:00', 'Monthly', NULL),
('89443012349', '2023-05-12', '16:20:00', 'Prepay', NULL),
('89443012340', '2022-06-25', '11:30:00', 'Monthly', 'Limited');


INSERT INTO PhonePlanType (simSerialNo, simOnly, phoneContract, mobileBroadband)
VALUES 
('89443012345', TRUE, FALSE, FALSE),
('89443012346', FALSE, TRUE, FALSE),
('89443012347', TRUE, FALSE, TRUE),
('89443012348', FALSE, TRUE, TRUE),
('89443012349', TRUE, FALSE, FALSE),
('89443012340', FALSE, FALSE, TRUE);

INSERT INTO TopUp (topUpAmount, topUpDate, simSerialNo)
VALUES 
(25.00, '2023-01-20', '89443012345'),
(10.00, '2023-02-21', '89443012346'),
(15.00, '2023-03-22', '89443012347'),
(32.00, '2023-04-23', '89443012348'),
(18.00, '2023-06-24', '89443012349'),
(22.00, '2023-06-25', '89443012340');


INSERT INTO BillSpecifications (mobilePlan, billAmount, dueDate, lateFeeDate, lateFee, simSerialNo)
VALUES 
('Essentials', 25.00, '2023-01-31', NULL, NULL, '89443012345'),
('No Frills', 10.00, '2023-02-28', NULL, NULL, '89443012346'),
('Smart Plan', 15.00, '2023-03-31', '2023-04-10', 5.00, '89443012347'),
('iPhone Essential', 32.00, '2023-04-30', NULL, NULL, '89443012348'),
('Android Essential', 18.00, '2023-05-31', '2023-06-10', 7.00, '89443012349'),
('Smart Special', 22.00, '2023-06-30', NULL, NULL, '89443012340');

INSERT INTO Deactivation (topUpDate, activationDate, simSerialNo)
VALUES 
('2023-01-20', '2022-01-15', '89443012345'),
('2023-02-21', '2016-02-10', '89443012346'),
('2023-03-22', '2014-09-10', '89443012347'),
('2023-04-23', '2015-04-05', '89443012348'),
('2023-05-24', '2023-05-12', '89443012349'),
('2023-06-25', '2022-06-25', '89443012340');

INSERT INTO Collections (lateFeeAmount, lateFeeDate, simSerialNo)
VALUES 
(5.00, '2023-04-10', '89443012347'),
(7.00, '2023-06-10', '89443012349');


/*

  _           _        ___   ___            __  ___  
 | |         | |      / _ \ / _ \     _    /_ |/ _ \ 
 | |     __ _| |__   | | | | (_) |  _| |_   | | | | |
 | |    / _` | '_ \  | | | |\__, | |_   _|  | | | | |
 | |___| (_| | |_) | | |_| |  / /    |_|    | | |_| |
 |______\__,_|_.__/   \___/  /_/            |_|\___/ 
 
    _____      _           _               _____                _             _       _       
  / ____|    | |         | |     ___     / ____|              | |           (_)     | |      
 | (___   ___| | ___  ___| |_   ( _ )   | |     ___  _ __  ___| |_ _ __ __ _ _ _ __ | |_ ___ 
  \___ \ / _ \ |/ _ \/ __| __|  / _ \/\ | |    / _ \| '_ \/ __| __| '__/ _` | | '_ \| __/ __|
  ____) |  __/ |  __/ (__| |_  | (_>  < | |___| (_) | | | \__ \ |_| | | (_| | | | | | |_\__ \
 |_____/ \___|_|\___|\___|\__|  \___/\/  \_____\___/|_| |_|___/\__|_|  \__,_|_|_| |_|\__|___/
                                                                                             

*/


/* This alter table statement will state that
   the integer can only be less than or equal
   to 700 using arithemetic operators */

ALTER TABLE Customer
MODIFY creditLevel INT CHECK (creditLevel <= 700);

/* This alter Table method adds another
   attribute called address to the column */

ALTER TABLE Customer
ADD address VARCHAR(255);

/* Select Statements */ 

SELECT
  simNumber AS "SIM Number",
  creditLevel AS "Credit Level",
  name AS "Name",
  emailAddress AS "Email Address",
  dateOfBirth AS "Date of Birth",
  id_type AS "ID Type",
  id_number AS "ID Number"
FROM
  Customer;

SELECT
  customerID AS "Customer ID",
  simSerialNo AS "SIM Serial Number"
FROM
  CustomerSim;
  
  
SELECT
  simSerialNo AS "SIM Serial Number",
  activationDate AS "Activation Date",
  activationTime AS "Activation Time",
  simType AS "SIM Type",
  restrictionType AS "Restriction Type"
FROM
  SimDetails;


SELECT
  simSerialNo AS "SIM Serial Number",
  simOnly AS "SIM Only",
  phoneContract AS "Phone Contract",
  mobileBroadband AS "Mobile Broadband"
FROM
  PhonePlanType;

SELECT
  topUpAmount AS "Top-Up Amount",
  topUpDate AS "Top-Up Date",
  simSerialNo AS "SIM Serial Number"
FROM
  TopUp;


SELECT
  mobilePlan AS "Mobile Plan",
  billAmount AS "Bill Amount",
  dueDate AS "Due Date",
  lateFeeDate AS "Late Fee Date",
  lateFee AS "Late Fee",
  lateFee + 1 AS "Late Fee", /* Adding 1 euro every late day */
  simSerialNo AS "SIM Serial Number"
FROM
  BillSpecifications;


SELECT
  topUpDate AS "Top-Up Date",
  activationDate AS "Activation Date",
  simSerialNo AS "SIM Serial Number"
FROM
  Deactivation;
  
  
/* This left join Feature query will choose 
   all the prepay customers in the database 
   
   However I don't know how to approach it :(
  
 SELECT
    c.simNumber AS "SIM Number",
    c.name AS "Customer Name",
    s.simSerialNo AS "SIM Serial Number",
    s.simType AS "SIM Type"
FROM Customer c
LEFT JOIN CustomerSim cs ON c.simNumber = cs.customerID
*/

    




