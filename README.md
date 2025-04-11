# ad-submission-system-postgres
This project is a modern rebuild of my original academic database system for managing advertising submissions. While the original schema was already normalized up to BCNF, this new version introduces several real-world enhancements to improve data integrity, flexibility, and security.

Key Improvements:

- Rebuilt using PostgreSQL for improved reliability and standards compliance

- Dockerized setup for easy local deployment and reproducibility

- Additional data validation constraints, e.g., age > 0, budget > 0

- Inclusive and flexible data types, such as supporting "Non-binary" and "Prefer not to say" in the gender field

- Separation of user credentials into a dedicated table, with plans for password hashing

- Sample data and query operations demonstrating joins, aggregates, updates, and constraint enforcement

This upgraded version is designed for real-world readiness and integration with web framework (Flask).
> Originally developed as part of a university course, now enhanced for real-world use.

### Sample Data Generation

To avoid manual insertion of values across 11 tables, I generated the `sample_data.sql` using Python. Each `INSERT INTO` statement was automatically constructed to match the relational schema.

Steps taken:
1. Defined lists of sample records for each table (e.g. staff, client).
2. Used Python to loop through and construct SQL insert statements.
3. Ensured foreign key relationships were respected.
4. Saved the final result into a single SQL script: `sql/sample_data/sample_data.sql`.

This method supports fast reloading, modification, and reproducibility.

## Diagram Design

### Entity-Relationship Diagram (ERD)

### ERD to Relational Mapping Table

| Relationship | Relation Between Entities | Relational Cardinality | Participation Cardinality |
|---|---|---|---|
| Has (Weak) | Staff – Payroll Record | 1 → N | Staff (T) – Payroll Record (T) |
| Work_in | Department – Staff | 1 → N | Department (P) – Staff (T) |
| Handle | Department – Project | 1 → N | Department (P) – Project (T) |
| Assign_to | Project – Staff | M → N | Project (T) – Staff (T) |
| Qualified_as | Request – Project | 1 → 1 | Request (P) – Project (T) |
| Submit | Client – Request | 1 → N | Client (P) – Request (T) |
| Owns | Staff – Credentials | 1 → 1 | Staff (T) – Credentials (T) |

### Formal Relational Schema
![relational schema](./images/relational_schema.png)

### Functional Dependencies

**Staff**

- SSN → Gender, Account name, Birth date, Address, Phone number, Firstname, Lastname, Dept_no, Start_date

**Full time / Part time / Internship**

- SSN → Experience

**Client**

- Client_ID → Firstname, Lastname, Gender, Account name, Phone number, Birth date, Address

**Department**

- Dept_No → Name, Location, Telephone number

**Request**

- Request_No → Submission date, Budget, Status, Description, Client_ID, Created_at, Updated_at

**Project**

- Project_No → Start_date, Due_date, Status, Budget, Description, Request_No, Dept_No, Created_at, Updated_at

**Payroll Record**

- Payroll_No → SSN, Date, Money

**Assign_to**

- (Project_No, SSN) → Assign_date

**Credentials**

- Credential_ID → SSN, Account_name, Password_hash


### BCNF Normalization check

| Table           | Primary Key / Candidate Key   | BCNF Satisfied? | Reason                                                                 |
|----------------|-------------------------------|-----------------|------------------------------------------------------------------------|
| staff          | ssn                            | Yes             | All non-key attributes fully depend on the superkey `ssn`              |
| client         | client_id                      | Yes             | `client_id` is the only determinant                                    |
| department     | dept_no                        | Yes             | Single key dependency with no transitive or partial issues             |
| project        | project_no                     | Yes             | No attribute is dependent on anything other than the superkey          |
| request        | request_no                     | Yes             | All non-key attributes directly depend on `request_no`                 |
| assign_to      | (project_no, ssn)              | Yes             | Composite key; assign_date depends on both keys                        |
| payroll_record | payroll_no                     | Yes             | All fields depend on `payroll_no`, the primary key                     |
| credentials    | credential_id                  | Yes             | All attributes depend directly on `credential_id`                      |
| full_time      | ssn                            | Yes             | Direct 1-to-1 mapping; fully dependent on primary key                  |
| part_time      | ssn                            | Yes             | Same as full_time                                                      |
| internship     | ssn                            | Yes             | Same as full_time                                                      |

### Data Dictionary

| Table Name | Column Name | Data Type | Description |
|---|---|---|---|
| department | dept_no | SERIAL (PK) | Unique department ID |
|  | name | VARCHAR(100) | Name of the department |
|  | location | VARCHAR(20) | Department location (e.g., floor, building) |
|  | telephone_number | VARCHAR(20) | Contact number for the department |
| staff | ssn | CHAR(10) (PK) | Social Security Number (identifier) |
|  | gender | VARCHAR(20) | Gender identity |
|  | account_name | VARCHAR(100) | System account name (login) |
|  | birth_date | DATE | Date of birth |
|  | address | VARCHAR(200) | Home or mailing address |
|  | phone_number | VARCHAR(20) | Contact number (unique) |
|  | firstname | VARCHAR(50) | First name of the staff member |
|  | lastname | VARCHAR(50) | Last name of the staff member |
|  | dept_no | INTEGER (FK) | Linked department ID |
|  | start_date | DATE | Employment start date |
| full_time | ssn | CHAR(10) (PK/FK) | Reference to full-time staff SSN |
|  | experience | TEXT | Description of experience |
| part_time | ssn | CHAR(10) (PK/FK) | Reference to part-time staff SSN |
|  | experience | TEXT | Description of experience |
| internship | ssn | CHAR(10) (PK/FK) | Reference to intern staff SSN |
|  | experience | TEXT | Description of experience |
| client | client_id | SERIAL (PK) | Unique client ID |
|  | firstname | VARCHAR(50) | First name |
|  | lastname | VARCHAR(50) | Last name |
|  | gender | VARCHAR(25) | Gender identity |
|  | account_name | VARCHAR(100) | Client’s login or platform account |
|  | phone_number | VARCHAR(20) | Contact number |
|  | birth_date | DATE | Date of birth |
|  | address | VARCHAR(200) | Residential address |
|  | created_at | TIMESTAMP | Timestamp when record was created |
|  | updated_at | TIMESTAMP | Timestamp when record was last updated |
| request | request_no | SERIAL (PK) | Unique ID for each request |
|  | submission_date | DATE | When the request was submitted |
|  | budget | INTEGER | Budget amount for the request |
|  | status | VARCHAR(20) | Status of the request (e.g., Pending) |
|  | description | TEXT | Description of the request |
|  | client_id | INTEGER (FK) | Linked client ID |
|  | created_at | TIMESTAMP | Record creation timestamp |
|  | updated_at | TIMESTAMP | Last update timestamp |
| project | project_no | SERIAL (PK) | Unique ID for each project |
|  | start_date | DATE | Project kickoff date |
|  | due_date | DATE | Project deadline |
|  | status | VARCHAR(50) | Project current status |
|  | budget | INTEGER | Allocated project budget |
|  | description | TEXT | Description of the project |
|  | request_no | INTEGER (FK) | Related request number |
|  | dept_no | INTEGER (FK) | Department handling the project |
|  | created_at | TIMESTAMP | When the project record was created |
|  | updated_at | TIMESTAMP | When the project was last updated |
| credentials | credential_id | SERIAL (PK) | Unique login credential ID |
|  | ssn | CHAR(10) (FK) | Associated staff SSN |
|  | account_name | VARCHAR(100) | Staff login name |
|  | password_hash | TEXT | Secure hashed password |
| assign_to | project_no | INTEGER (PK/FK) | Assigned project number |
|  | ssn | CHAR(10) (PK/FK) | Staff SSN assigned to project |
|  | assign_date | DATE | Date of assignment |
| payroll_record | payroll_no | SERIAL (PK) | Unique payroll ID |
|  | ssn | CHAR(10) (FK) | Linked staff SSN |
|  | date | DATE | Date of payroll record |
|  | money | INTEGER | Salary amount |

