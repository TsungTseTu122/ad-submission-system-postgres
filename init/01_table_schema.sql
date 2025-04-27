-- Department Table
CREATE TABLE department (
    dept_no SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(20),
    telephone_number VARCHAR(20)
);

-- Staff Table
CREATE TABLE staff (
    ssn CHAR(10) PRIMARY KEY,
    gender VARCHAR(20),
    birth_date DATE,
    address VARCHAR(200),
    position VARCHAR(50),
    phone_number VARCHAR(20),
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    dept_no INTEGER REFERENCES department(dept_no),
    start_date DATE
);

-- Staff Credential Table
CREATE TABLE staff_credential (
    credential_id SERIAL PRIMARY KEY,
    ssn CHAR(10) UNIQUE REFERENCES staff(ssn),
    account_name VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

-- Client Table
CREATE TABLE client (
    client_id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    gender VARCHAR(25),
    phone_number VARCHAR(20),
    birth_date DATE,
    address VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Client Credential Table
CREATE TABLE client_credential (
    credential_id SERIAL PRIMARY KEY,
    client_id INTEGER UNIQUE REFERENCES client(client_id),
    account_name VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

-- Request Table
CREATE TABLE request (
    request_no SERIAL PRIMARY KEY,
    submission_date DATE,
    budget INTEGER CHECK (budget > 0),
    status VARCHAR(20),
    description TEXT,
    client_id INTEGER REFERENCES client(client_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Project Table
CREATE TABLE project (
    project_no SERIAL PRIMARY KEY,
    start_date DATE,
    due_date DATE,
    status VARCHAR(50),
    budget INTEGER CHECK (budget > 0),
    description TEXT,
    request_no INTEGER REFERENCES request(request_no),
    dept_no INTEGER REFERENCES department(dept_no),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Assign_to Table (Many-to-Many)
CREATE TABLE assign_to (
    project_no INTEGER,
    ssn CHAR(10),
    assign_date DATE,
    PRIMARY KEY (project_no, ssn),
    FOREIGN KEY (project_no) REFERENCES project(project_no),
    FOREIGN KEY (ssn) REFERENCES staff(ssn)
);

-- Payroll Record (Weak entity)
CREATE TABLE payroll_record (
    payroll_no SERIAL PRIMARY KEY,
    ssn CHAR(9) REFERENCES staff(ssn),  
    salary INTEGER CHECK (salary > 0),
    bonus INTEGER DEFAULT 0 CHECK (bonus >= 0),
    pay_date DATE NOT NULL
);

-- Full-time Staff Specialization
CREATE TABLE full_time (
    ssn CHAR(10) PRIMARY KEY REFERENCES staff(ssn),
    experience TEXT
);

-- Part-time Staff Specialization
CREATE TABLE part_time (
    ssn CHAR(10) PRIMARY KEY REFERENCES staff(ssn),
    experience TEXT
);

-- Internship Staff Specialization
CREATE TABLE internship (
    ssn CHAR(10) PRIMARY KEY REFERENCES staff(ssn),
    experience TEXT
);