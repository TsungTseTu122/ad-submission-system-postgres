import random
from faker import Faker # generate fake data
from datetime import timedelta
from pathlib import Path # Used to save output cleanly


# reproducibility for check
fake = Faker('zh_TW')
Faker.seed(69)
random.seed(69)

# Shared pools for primary keys
staff_ssns = []
client_ids = list(range(1, 11))  # assuming client_id will be 1 to 10 only



# Generate INSERT statements for client table
def generate_clients(n=10):
    sql = []
    for client_id in client_ids:
        firstname = fake.first_name()
        lastname = fake.last_name()
        gender = random.choice(["Male", "Female", "Non-binary", "Prefer not to say"])
        # Taiwan mobile number format: starts with 09 followed by 8 digits
        phone_number = f"09{random.randint(10000000, 99999999)}"
        birth_date = fake.date_of_birth(minimum_age=20, maximum_age=60)
        address = fake.address().replace("\n", ", ")
        sql.append(f"INSERT INTO client (firstname, lastname, gender, phone_number, birth_date, address) "
                   f"VALUES ('{firstname}', '{lastname}', '{gender}', {phone_number}, '{birth_date}', '{address}') "
                   f"ON CONFLICT DO NOTHING;")
    return "\n".join(sql)


# Generate INSERT statements for department table
def generate_departments(n=5):
    sql = []
    for i in range(1, n+1):
        name = f"Dept_{i}"
        location = f"{i}F"

        # Simulate Taiwan landline format: (0X)XXXXXXX or (02)XXXXYYYY
        area_code = random.choice(["02", "03", "04", "05", "06", "07"])
        local_number = random.randint(1000000, 9999999)
        phone = f"{area_code}-{local_number}"

        sql.append(f"""
        INSERT INTO department (name, location, telephone_number)
        VALUES ('{name}', '{location}', '{phone}')
        ON CONFLICT DO NOTHING;
        """.strip())
    
    return "\n".join(sql)


# Generate INSERT statements for staff table
def generate_staff(n=10):
    sql = []
    positions = ["Manager", "Analyst", "Coordinator", "Specialist", "Intern"]
    
    for i in range(1, n + 1):
        ssn = str(i).zfill(9)  # Unique SSN 000000001, 000000002...
        staff_ssns.append(ssn)
        
        position = random.choice(positions)
        firstname = fake.first_name()
        lastname = fake.last_name()
        gender = random.choice(["Male", "Female", "Non-binary", "Prefer not to say"])
        birth_date = fake.date_of_birth(minimum_age=18, maximum_age=65)
        address = fake.address().replace("\n", ", ").replace("'", "''")
        phone = f"09{random.randint(10000000, 99999999)}"  # Taiwan-style mobile number
        dept_no = random.randint(1, 5)
        start_date = fake.date_between(start_date='-5y', end_date='today')
        
        sql.append(f"""
        INSERT INTO staff (
            ssn, gender, birth_date, address, phone_number,
            firstname, lastname, dept_no, start_date, position
        ) VALUES (
            '{ssn}', '{gender}', '{birth_date}', '{address}', '{phone}',
            '{firstname}', '{lastname}', {dept_no}, '{start_date}', '{position}'
        ) ON CONFLICT DO NOTHING;
        """.strip())
    
    return "\n".join(sql)



# Generate INSERT statements for staff_credential table
def generate_staff_credentials():
    sql = []
    for i, ssn in enumerate(staff_ssns):
        account_name = f"user{i}"
        password_hash = fake.sha256()
        sql.append(f"INSERT INTO staff_credential (ssn, account_name, password_hash) "
                   f"VALUES ('{ssn}', '{account_name}', '{password_hash}') ON CONFLICT DO NOTHING;")
    return "\n".join(sql)


# Generate INSERT statements for client_credential table
def generate_client_credentials():
    sql = []
    for i in client_ids:
        account_name = f"client{i}"
        password_hash = fake.sha256()
        sql.append(f"INSERT INTO client_credential (client_id, account_name, password_hash) "
                   f"VALUES ({i}, '{account_name}', '{password_hash}') ON CONFLICT DO NOTHING;")
    return "\n".join(sql)


# Generate INSERT statements for request table
def generate_requests(n=10):
    sql = []
    for i in range(1, n+1):
        date = fake.date_between(start_date='-1y', end_date='today')
        budget = random.randint(1000, 50000)
        status = random.choice(["Pending", "Approved", "Rejected"])
        description = fake.text(max_nb_chars=100).replace("'", "''")
        client_id = random.choice(client_ids)
        sql.append(f"INSERT INTO request (submission_date, budget, status, description, client_id) "
                   f"VALUES ('{date}', {budget}, '{status}', '{description}', {client_id}) ON CONFLICT DO NOTHING;")
    return "\n".join(sql)


# Generate INSERT statements for project table
def generate_projects(n=10):
    sql = []
    for i in range(1, n+1):
        start_date = fake.date_between(start_date='-6mo', end_date='today')
        due_date = start_date + timedelta(days=random.randint(30, 180))
        status = random.choice(["Not Started", "In Progress", "Completed"])
        budget = random.randint(5000, 100000)
        description = fake.sentence().replace("'", "''")
        request_no = i
        dept_no = random.randint(1, 5)
        sql.append(f"INSERT INTO project (start_date, due_date, status, budget, description, request_no, dept_no) "
                   f"VALUES ('{start_date}', '{due_date}', '{status}', {budget}, '{description}', {request_no}, {dept_no}) ON CONFLICT DO NOTHING;")
    return "\n".join(sql)


def generate_payroll_records():
    sql = []
    for ssn in staff_ssns:
        salary = random.randint(30000, 70000)
        bonus = random.randint(1000, 10000)
        pay_date = fake.date_between(start_date='-6m', end_date='today')
        sql.append(f"""
            INSERT INTO payroll_record (ssn, salary, bonus, pay_date)
            VALUES ('{ssn}', {salary}, {bonus}, '{pay_date}')
            ON CONFLICT DO NOTHING;
        """)
    return "\n".join(sql)

# Generate INSERT statements for assign_to relationship table
def generate_assignments(n=10):
    sql = []
    for _ in range(n):
        ssn = random.choice(staff_ssns)
        project_no = random.randint(1, 10)
        assign_date = fake.date_between(start_date='-1y', end_date='today')
        sql.append(f"INSERT INTO assign_to (project_no, ssn, assign_date) "
                   f"VALUES ({project_no}, '{ssn}', '{assign_date}') ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

def generate_employment_types():
    sql = []
    employment_types = ["full_time", "part_time", "internship"]

    for ssn in staff_ssns:
        employment = random.choice(employment_types)
        experience_text = fake.job()  # 隨機生成經驗描述
        if employment == "full_time":
            sql.append(f"INSERT INTO full_time (ssn, experience) VALUES ('{ssn}', '{experience_text}') ON CONFLICT DO NOTHING;")
        elif employment == "part_time":
            sql.append(f"INSERT INTO part_time (ssn, experience) VALUES ('{ssn}', '{experience_text}') ON CONFLICT DO NOTHING;")
        else:
            sql.append(f"INSERT INTO internship (ssn, experience) VALUES ('{ssn}', '{experience_text}') ON CONFLICT DO NOTHING;")
    
    return "\n".join(sql)




# Main script: generate everything and write to file
if __name__ == "__main__":
    all_sql = "\n\n".join([
        "-- Clients\n" + generate_clients(),
        "-- Departments\n" + generate_departments(),
        "-- Staff\n" + generate_staff(),
        "-- Staff Credentials\n" + generate_staff_credentials(),
        "-- Client Credentials\n" + generate_client_credentials(),
        "-- Requests\n" + generate_requests(),
        "-- Projects\n" + generate_projects(),
        "-- Payroll Records\n" + generate_payroll_records(),            
        "-- Employment Types (Full-Time / Part-Time / Internship)\n" + generate_employment_types(),  
        "-- Assignments\n" + generate_assignments()
    ])

    Path("../init/02_sample_data.sql").write_text(all_sql)
    print("✅ Sample data written to 02_sample_data.sql")