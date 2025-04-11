CREATE TABLE department (
  dept_no SERIAL PRIMARY KEY,
  name VARCHAR(100),
  location VARCHAR(20),
  telephone_number VARCHAR(20) UNIQUE
);

CREATE TABLE staff (
  ssn CHAR(10) PRIMARY KEY,
  gender VARCHAR(20) CHECK (gender IN ('Male', 'Female', 'Non-binary', 'Prefer not to say')),
  account_name VARCHAR(100),
  birth_date DATE,
  address VARCHAR(200),
  phone_number VARCHAR(20) UNIQUE,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  dept_no INTEGER REFERENCES department(dept_no),
  start_date DATE
);

CREATE TABLE credentials (
  credential_id SERIAL PRIMARY KEY,
  ssn CHAR(10) REFERENCES staff(ssn) ON DELETE CASCADE,
  account_name VARCHAR(100) UNIQUE NOT NULL,
  password_hash TEXT NOT NULL
);

CREATE TABLE full_time (
  ssn CHAR(10) PRIMARY KEY REFERENCES staff(ssn),
  experience TEXT
);

CREATE TABLE part_time (
  ssn CHAR(10) PRIMARY KEY REFERENCES staff(ssn),
  experience TEXT
);

CREATE TABLE internship (
  ssn CHAR(10) PRIMARY KEY REFERENCES staff(ssn),
  experience TEXT
);

CREATE TABLE client (
  client_id SERIAL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  gender VARCHAR(25),
  account_name VARCHAR(100) UNIQUE,
  phone_number VARCHAR(20),
  birth_date DATE,
  address VARCHAR(200),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE request (
  request_no SERIAL PRIMARY KEY,
  submission_date DATE,
  budget INTEGER CHECK (budget > 0),
  status VARCHAR(20) DEFAULT 'Pending',
  description TEXT,
  client_id INTEGER REFERENCES client(client_id) ON DELETE SET NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE project (
  project_no SERIAL PRIMARY KEY,
  start_date DATE,
  due_date DATE,
  status VARCHAR(50),
  budget INTEGER CHECK (budget >= 0),
  description TEXT,
  request_no INTEGER UNIQUE REFERENCES request(request_no),
  dept_no INTEGER REFERENCES department(dept_no),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE assign_to (
  project_no INTEGER REFERENCES project(project_no),
  ssn CHAR(10) REFERENCES staff(ssn) ON DELETE SET NULL,
  assign_date DATE,
  PRIMARY KEY (project_no, ssn)
);

CREATE TABLE payroll_record (
  payroll_no SERIAL PRIMARY KEY,
  ssn CHAR(10) REFERENCES staff(ssn),
  date DATE,
  money INTEGER CHECK (money >= 0)
);