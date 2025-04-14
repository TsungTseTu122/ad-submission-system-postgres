-- Clients
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Gabrielle', 'Davis', 'Male', 1716893640, '1987-09-25', '6978 Castro Valleys Suite 266, South Justinborough, ME 28157') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Heather', 'Guerrero', 'Male', 4506816712, '1971-04-23', '9501 Jeffery Drive, East Joshua, NJ 82628') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Linda', 'Park', 'Female', 8017065798, '2000-09-07', '1146 Moore Overpass, Leeside, SC 53164') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Jay', 'Nelson', 'Male', 7103856081, '2002-08-07', '896 Christopher Mills Suite 215, Costatown, WV 51750') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Oscar', 'Dorsey', 'Non-binary', 7969961357, '1994-07-30', '88077 Sandra Stravenue Suite 116, Port Stacey, CA 90109') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Charles', 'Chase', 'Non-binary', 7609956396, '2003-09-01', '66849 Allen Viaduct Apt. 214, Lake Sarahberg, ID 15007') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Kelly', 'Blake', 'Prefer not to say', 5317863998, '1971-09-01', '18649 Dodson Streets Suite 760, Hintonburgh, VA 20261') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Mark', 'Estrada', 'Prefer not to say', 6199607362, '1988-01-09', '60253 Cox Unions Suite 745, South Joseph, FL 13352') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Emily', 'Villanueva', 'Prefer not to say', 9090510465, '1989-08-10', '40113 Rachel Hill, East Barbarachester, CT 60485') ON CONFLICT DO NOTHING;
INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) VALUES ('Michael', 'Maddox', 'Prefer not to say', 6563380450, '1975-08-14', '2347 Green Parkways, West Jerrymouth, CT 35530') ON CONFLICT DO NOTHING;

-- Departments
INSERT INTO department (name, location, telephone_number) VALUES ('Dept_1', '1F', '(886)1415470') ON CONFLICT DO NOTHING;
INSERT INTO department (name, location, telephone_number) VALUES ('Dept_2', '2F', '(041)7144589x136') ON CONFLICT DO NOTHING;
INSERT INTO department (name, location, telephone_number) VALUES ('Dept_3', '3F', '0069473413x124') ON CONFLICT DO NOTHING;
INSERT INTO department (name, location, telephone_number) VALUES ('Dept_4', '4F', '8656124151') ON CONFLICT DO NOTHING;
INSERT INTO department (name, location, telephone_number) VALUES ('Dept_5', '5F', '0010895016358x2614') ON CONFLICT DO NOTHING;

-- Staff
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('1458410346', 'Non-binary', '1971-12-20', '8433 Foley Drives Suite 556, Mariamouth, ND 42908', '9071519581', 'James', 'Smith', 5, '2020-07-21') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('4513896531', 'Prefer not to say', '1976-07-19', '0363 Stacy Ford Apt. 252, East Alexandra, MS 75298', '4805211332', 'Cory', 'Smith', 2, '2021-08-17') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('4983299995', 'Prefer not to say', '1976-11-19', '997 Holden Ford, Heatherborough, MD 73553', '6640044679', 'Thomas', 'Palmer', 4, '2020-06-28') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('6363786369', 'Male', '1980-09-25', '67372 Rodriguez Ramp, New Eric, ND 52748', '6655413602', 'Catherine', 'Norris', 4, '2024-11-28') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('3389597040', 'Non-binary', '1983-10-14', '9783 Teresa Lodge Suite 913, Johnsonburgh, HI 79749', '2410049004', 'Sharon', 'Lopez', 2, '2023-06-04') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('6637929782', 'Female', '2002-06-02', '8189 Elizabeth Track, North Nicholas, IL 40080', '7038539501', 'Travis', 'Bailey', 2, '2024-05-14') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('7414295044', 'Non-binary', '1991-03-14', '4066 Knight Overpass, Port Victoriamouth, ND 54945', '8169430189', 'Shirley', 'Freeman', 2, '2022-08-19') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('2387467502', 'Female', '1981-03-30', '01113 Archer Run Apt. 506, South Chelseaborough, NC 38969', '4072933298', 'Kyle', 'Ruiz', 1, '2024-01-20') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('4270499447', 'Male', '2000-06-08', '3375 Robert Forge, Jeffmouth, NV 19561', '4772739841', 'Joseph', 'Dunn', 4, '2021-11-01') ON CONFLICT DO NOTHING;
INSERT INTO staff (ssn, gender, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) VALUES ('0810437384', 'Male', '1980-04-21', '5073 Joshua Harbor Apt. 629, Gordonmouth, MI 32884', '6135076117', 'Steven', 'Tate', 3, '2025-03-12') ON CONFLICT DO NOTHING;

-- Staff Credentials
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('6023790223', 'user0', 'f58cf5adbbca1dc9a60e1d78680c6430f07f9df5c5fe66338f2581f34ea69272') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('8357758680', 'user1', '3a0f184a26223037815ef4212ffcde270fc55cd0e91090d37ac278bde5d1c84d') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('2421681148', 'user2', '54c9fd57f66d831c202b5a69c6544bae15f53c8de964e95ff3f270bc2c594189') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('1365480177', 'user3', '451a5f70d0bacc81fd114fd7b2d33c23ecc06ecb2a97da279f1a89e21dcd9749') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('4288345998', 'user4', '33875dbde0ddbf7cce7b9e7d45bbac9a5e19b1518c542780fbe2e3994853207f') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('3576104995', 'user5', '340edf997630d6a73a5c9c42a76aa2e49bae22f17aa6cb4ccc83ccaed8569ba2') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('5534699856', 'user6', 'e2a156fd9900b61a39d5d2a88d9c81a67700cee487b499fbd480ab399f7a0d50') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('4182397550', 'user7', 'f9f2b56e05af80d5b1113f844b06cd3cdd1f1526643f45ff5dfd90e06e1a8c56') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('6965283218', 'user8', '16d84cbbbb1f42683d96f2612b82e707e669c24a1eece7b5a30c9d6b18738ed7') ON CONFLICT DO NOTHING;
INSERT INTO staff_credential (ssn, account_name, password_hash) VALUES ('1108056862', 'user9', '09cb3621876ed371fea2880d30cf5ee3170e0f56bf46bd10e8401097ea9b5308') ON CONFLICT DO NOTHING;

-- Client Credentials
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (1, 'client1', '64f18dabae8de166a937f002f39c1b3d737db5f55f6bea4f40f2537ccc141947') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (2, 'client2', '714b333e7c600a5898f2b059d678b7d93189379577abe5ef5bf3c470208376fd') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (3, 'client3', '8bede70fda8d6f284619852bdcaf850373a68b9073279524d9a190263ef88a60') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (4, 'client4', 'b8e0f5726a23cb36038553b88d2e2b325903875bf3331c6b5241a965d5422094') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (5, 'client5', '6a5fc35e31d296d23973494be5cb0418245a321146178f6cede4651cffe5cac8') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (6, 'client6', 'add9c08c646e3a082b9512924cee648b315011616867d452647b8496179c64a1') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (7, 'client7', '915b0b4fb825384934ebbf88342fa0117621479bdfd936fabfb98db3c513c66c') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (8, 'client8', '2e4457b3df09ba7713702c1d642a07e814ca2e571fa6ae0d067b97ba0d6cdc49') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (9, 'client9', '98133bf8aad6b7ff58c2c34b63e47f9ae0045c8439cfeb021b6e97901be60ba1') ON CONFLICT DO NOTHING;
INSERT INTO client_credential (client_id, account_name, password_hash) VALUES (10, 'client10', '7edfe8798f13903d73311081368f4e1ebddf823761bc8c923954b650623cd94e') ON CONFLICT DO NOTHING;

-- Requests
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-01-17', 48389, 'Rejected', 'Final house field summer.', 6) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-10-05', 3666, 'Pending', 'Security us TV. Color as hour tend three.
Compare say such.', 2) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-04-28', 15319, 'Pending', 'Impact career agency evening customer contain. Both yard or kind safe.', 3) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-09-23', 17332, 'Pending', 'Local fish interview girl. Sea month finally employee. Day plant magazine read kind.', 5) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-06-28', 10862, 'Approved', 'Open sister quickly operation edge manage lead. Who know four. Color study challenge building low.', 2) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-01-02', 47011, 'Approved', 'Suffer drug less certain. Every black strategy story dog worker. Hear window yeah those experience.', 5) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-04-09', 36058, 'Rejected', 'Last wish my throughout social decide father. Care month official recent.', 7) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-07-02', 3193, 'Approved', 'Lay leg trip stay good. Suddenly policy and. Society condition indeed natural continue.', 2) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2024-11-23', 49284, 'Pending', 'Itself teacher view vote scientist effort staff. Practice question require find official economic.', 5) ON CONFLICT DO NOTHING;
INSERT INTO request (submission_date, budget, status, description, client_id) VALUES ('2025-04-05', 26981, 'Rejected', 'Toward action east animal relate far. Message sort authority.', 5) ON CONFLICT DO NOTHING;

-- Projects
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-06-20', 'Completed', 69024, 'Avoid need current true hot film.', 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-06-30', 'In Progress', 74875, 'Worker decade white.', 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-08-22', 'Not Started', 90821, 'Risk whom move.', 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-08-25', 'In Progress', 60202, 'Instead site believe purpose on time.', 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-10-03', 'Not Started', 74807, 'Contain effort go cold charge.', 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-09-18', 'Completed', 54914, 'Early guess this tend specific.', 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-06-01', 'In Progress', 99053, 'Line approach discover industry.', 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-06-13', 'Not Started', 95385, 'Might population high walk huge magazine.', 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-09-15', 'Not Started', 8559, 'Amount eight provide cost floor majority.', 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) VALUES ('2025-04-12', '2025-08-17', 'Completed', 37187, 'Strategy this claim ball write personal worry.', 10, 5) ON CONFLICT DO NOTHING;

-- Payroll
INSERT INTO payroll_record (ssn, date, money) VALUES ('5945214528', '2025-01-29', 5118) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('8698845032', '2025-01-21', 6647) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('0879701752', '2025-01-03', 4243) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('1605543453', '2025-03-13', 3481) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('2313860104', '2025-04-08', 5332) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('4629662180', '2025-02-19', 3942) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('5743636396', '2025-01-20', 7482) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('7982155039', '2025-03-23', 7117) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('5764556190', '2025-01-06', 3473) ON CONFLICT DO NOTHING;
INSERT INTO payroll_record (ssn, date, money) VALUES ('2403652294', '2025-02-16', 7089) ON CONFLICT DO NOTHING;

-- Assignments
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (8, '7283447143', '2024-09-09') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (10, '0153204343', '2024-06-06') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (4, '7579215608', '2025-02-17') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (10, '1052946355', '2025-03-13') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (9, '4695962129', '2024-12-01') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (6, '4866961509', '2025-03-15') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (2, '2449926863', '2024-08-05') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (2, '7414643178', '2025-03-08') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (7, '7103819664', '2024-05-12') ON CONFLICT DO NOTHING;
INSERT INTO assign_to (project_no, ssn, assign_date) VALUES (3, '3852435065', '2024-08-24') ON CONFLICT DO NOTHING;