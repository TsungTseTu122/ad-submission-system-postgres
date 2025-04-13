import random
from faker import Faker
from datetime import timedelta

fake = Faker()
Faker.seed(0)
random.seed(0)

def generate_clients(n=10):
    sql = []
    for _ in range(n):
        firstname = fake.first_name()
        lastname = fake.last_name()
        gender = random.choice(["Male", "Female", "Non-binary", "Prefer not to say"])
        account_name = f"{firstname.lower()}.{lastname.lower()}{random.randint(10,99)}"
        phone_number = fake.random_number(digits=10, fix_len=True)
        birth_date = fake.date_of_birth(minimum_age=20, maximum_age=60)
        address = fake.address().replace("\n", ", ")
        sql.append(f"INSERT INTO client (firstname, lastname, gender, account_name, phone_number, birth_date, address) "
                   f"VALUES ('{firstname}', '{lastname}', '{gender}', '{account_name}', {phone_number}, '{birth_date}', '{address}') "
                   f"ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

def generate_departments(n=5):
    sql = []
    for i in range(1, n+1):
        name = f"Dept_{i}"
        location = f"{i}F"
        phone = fake.phone_number().replace(" ", "").replace("-", "")
        sql.append(f"INSERT INTO department (name, location, telephone_number) "
                   f"VALUES ('{name}', '{location}', '{phone}') ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

def generate_staff(n=10):
    sql = []
    for _ in range(n):
        ssn = fake.unique.numerify(text='##########')
        firstname = fake.first_name()
        lastname = fake.last_name()
        gender = random.choice(["Male", "Female", "Non-binary", "Prefer not to say"])
        account_name = f"{firstname.lower()}.{lastname.lower()}{random.randint(10,99)}"
        birth_date = fake.date_of_birth(minimum_age=22, maximum_age=60)
        address = fake.address().replace("\n", ", ")
        phone = fake.random_number(digits=10, fix_len=True)
        dept_no = random.randint(1, 5)
        start_date = fake.date_between(start_date='-5y', end_date='today')
        sql.append(f"INSERT INTO staff (ssn, gender, account_name, birth_date, address, phone_number, firstname, lastname, dept_no, start_date) "
                   f"VALUES ('{ssn}', '{gender}', '{account_name}', '{birth_date}', '{address}', '{phone}', '{firstname}', '{lastname}', {dept_no}, '{start_date}') "
                   f"ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

def generate_staff_credentials(n=10):
    sql = []
    for i in range(n):
        ssn = fake.unique.numerify(text='##########')
        account_name = f"user{i}"
        password_hash = fake.sha256()
        sql.append(f"INSERT INTO staff_credential (ssn, account_name, password_hash) "
                   f"VALUES ('{ssn}', '{account_name}', '{password_hash}') ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

def generate_client_credentials(n=10):
    sql = []
    for client_id in range(1, n + 1):
        account_name = f"client{client_id}"
        password_hash = fake.sha256()
        sql.append(f"INSERT INTO client_credential (client_id, account_name, password_hash) "
                   f"VALUES ({client_id}, '{account_name}', '{password_hash}') ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

def generate_requests(n=10):
    sql = []
    for i in range(1, n+1):
        date = fake.date_between(start_date='-1y', end_date='today')
        budget = random.randint(1000, 50000)
        status = random.choice(["Pending", "Approved", "Rejected"])
        description = fake.text(max_nb_chars=100).replace("'", "''")
        client_id = random.randint(1, 10)
        sql.append(f"INSERT INTO request (submission_date, budget, status, description, client_id) "
                   f"VALUES ('{date}', {budget}, '{status}', '{description}', {client_id}) ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

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

def generate_payroll(n=10):
    sql = []
    for _ in range(n):
        ssn = fake.unique.numerify(text='##########')
        date = fake.date_this_year()
        money = random.randint(3000, 10000)
        sql.append(f"INSERT INTO payroll_record (ssn, date, money) "
                   f"VALUES ('{ssn}', '{date}', {money}) ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

def generate_assignments(n=10):
    sql = []
    for _ in range(n):
        ssn = fake.unique.numerify(text='##########')
        project_no = random.randint(1, 10)
        assign_date = fake.date_between(start_date='-1y', end_date='today')
        sql.append(f"INSERT INTO assign_to (project_no, ssn, assign_date) "
                   f"VALUES ({project_no}, '{ssn}', '{assign_date}') ON CONFLICT DO NOTHING;")
    return "\n".join(sql)

# Example runner
if __name__ == "__main__":
    all_sql = "\\n\\n".join([
        "-- Clients\\n" + generate_clients(),
        "-- Departments\\n" + generate_departments(),
        "-- Staff\\n" + generate_staff(),
        "-- Staff Credentials\\n" + generate_staff_credentials(),
        "-- Client Credentials\\n" + generate_client_credentials(),
        "-- Requests\\n" + generate_requests(),
        "-- Projects\\n" + generate_projects(),
        "-- Payroll\\n" + generate_payroll(),
        "-- Assignments\\n" + generate_assignments()
    ])

    with open("sample_data.sql", "w") as f:
        f.write(all_sql)
    print("sample_data.sql generated!!!")

if __name__ == "__main__":
    from pathlib import Path
    Faker.seed(69)
    random.seed(69)

    all_sql = "\n\n".join([
        "-- Clients\n" + generate_clients(),
        "-- Departments\n" + generate_departments(),
        "-- Staff\n" + generate_staff(),
        "-- Staff Credentials\n" + generate_staff_credentials(),
        "-- Client Credentials\n" + generate_client_credentials(),
        "-- Requests\n" + generate_requests(),
        "-- Projects\n" + generate_projects(),
        "-- Payroll\n" + generate_payroll(),
        "-- Assignments\n" + generate_assignments()
    ])

    Path("sample_data.sql").write_text(all_sql)
    print("Sample data written to sample_data.sql")