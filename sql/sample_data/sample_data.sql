-- Departments
INSERT INTO department (name, location, telephone_number) VALUES ('Marketing', '3F', '073345678');
INSERT INTO department (name, location, telephone_number) VALUES ('Design', '2F', '073345679');
INSERT INTO department (name, location, telephone_number) VALUES ('Engineering', '5F', '073345680');
INSERT INTO department (name, location, telephone_number) VALUES ('HR', '1F', '073345681');
INSERT INTO department (name, location, telephone_number) VALUES ('Finance', '4F', '073345682');

-- Staff
INSERT INTO staff (ssn, gender, account_name, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('A123456789', 'Male', 'jchan', '1988-02-01', '123 Queen St, Brisbane', '0412345678', 'Jackie', 'Chan', 1, '2021-01-10');
INSERT INTO staff (ssn, gender, account_name, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('B987654321', 'Female', 'elara.w', '1990-11-23', '456 King St, Brisbane', '0498765432', 'Elara', 'Wong', 2, '2020-07-01');
INSERT INTO staff (ssn, gender, account_name, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('C102938475', 'Non-binary', 'mkim', '1995-08-15', '789 Edward St, Brisbane', '0432123456', 'Morgan', 'Kim', 3, '2022-06-15');
INSERT INTO staff (ssn, gender, account_name, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('D564738291', 'Prefer not to say', 'npatel', '1992-04-09', '101 Roma St, Brisbane', '0481122334', 'Nina', 'Patel', 4, '2019-12-01');
INSERT INTO staff (ssn, gender, account_name, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('E837465920', 'Male', 'cwang', '1985-12-20', '321 Ann St, Brisbane', '0409988776', 'Chris', 'Wang', 5, '2023-03-05');

-- Clients
INSERT INTO client (firstname, lastname, gender, account_name, phone_number, birth_date, address) VALUES ('Lucas', 'Lin', 'Male', 'lucas_lin', 886912345678, '1995-05-11', 'Taipei, Taiwan');
INSERT INTO client (firstname, lastname, gender, account_name, phone_number, birth_date, address) VALUES ('Fiona', 'Tsai', 'Female', 'fiona_t', 886987654321, '1998-10-25', 'Kaohsiung, Taiwan');
INSERT INTO client (firstname, lastname, gender, account_name, phone_number, birth_date, address) VALUES ('Henry', 'Chen', 'Male', 'henry_chen', 886955512345, '1991-03-03', 'Taichung, Taiwan');
INSERT INTO client (firstname, lastname, gender, account_name, phone_number, birth_date, address) VALUES ('Wendy', 'Liu', 'Female', 'wendy_l', 886928374652, '1993-07-19', 'Tainan, Taiwan');
INSERT INTO client (firstname, lastname, gender, account_name, phone_number, birth_date, address) VALUES ('Yuki', 'Huang', 'Non-binary', 'yuki_h', 886926789543, '1997-12-30', 'Hsinchu, Taiwan');

-- Credentials
INSERT INTO credentials (credential_id, ssn, account_name, password_hash) VALUES (1, 'A123456789', 'jchan', 'hashed_pw_1');
INSERT INTO credentials (credential_id, ssn, account_name, password_hash) VALUES (2, 'B987654321', 'elara.w', 'hashed_pw_2');
INSERT INTO credentials (credential_id, ssn, account_name, password_hash) VALUES (3, 'C102938475', 'mkim', 'hashed_pw_3');
INSERT INTO credentials (credential_id, ssn, account_name, password_hash) VALUES (4, 'D564738291', 'npatel', 'hashed_pw_4');
INSERT INTO credentials (credential_id, ssn, account_name, password_hash) VALUES (5, 'E837465920', 'cwang', 'hashed_pw_5');

-- Requests
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-04-11', 1500, 'Pending', 'Request 1 for marketing campaign', 1);
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-04-12', 2000, 'Pending', 'Request 2 for marketing campaign', 2);
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-04-13', 2500, 'Pending', 'Request 3 for marketing campaign', 3);
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-04-14', 3000, 'Pending', 'Request 4 for marketing campaign', 4);
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-04-15', 3500, 'Pending', 'Request 5 for marketing campaign', 5);

-- Projects
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2024-05-6', '2024-06-6', 'Ongoing', 6000, 'Project 1 - media ad', 1, 1);
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2024-05-7', '2024-06-7', 'Ongoing', 7000, 'Project 2 - media ad', 2, 2);
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2024-05-8', '2024-06-8', 'Ongoing', 8000, 'Project 3 - media ad', 3, 3);
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2024-05-9', '2024-06-9', 'Ongoing', 9000, 'Project 4 - media ad', 4, 4);
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2024-05-10', '2024-06-10', 'Ongoing', 10000, 'Project 5 - media ad', 5, 5);

-- Assignments
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (1, 'A123456789', '2024-05-6');
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (2, 'B987654321', '2024-05-7');
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (3, 'C102938475', '2024-05-8');
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (4, 'D564738291', '2024-05-9');
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (5, 'E837465920', '2024-05-10');

-- Payroll Records
INSERT INTO payroll_record (ssn, date, money) VALUES ('A123456789', '2024-04-01', 4200);
INSERT INTO payroll_record (ssn, date, money) VALUES ('B987654321', '2024-04-01', 4400);
INSERT INTO payroll_record (ssn, date, money) VALUES ('C102938475', '2024-04-01', 4600);
INSERT INTO payroll_record (ssn, date, money) VALUES ('D564738291', '2024-04-01', 4800);
INSERT INTO payroll_record (ssn, date, money) VALUES ('E837465920', '2024-04-01', 5000);

-- Full Time
INSERT INTO full_time (ssn, experience) VALUES ('A123456789', '5 years experience in strategy');

-- Part Time
INSERT INTO part_time (ssn, experience) VALUES ('B987654321', '2 years part-time design');

-- Internship
INSERT INTO internship (ssn, experience) VALUES ('C102938475', '6-month internship in analytics');