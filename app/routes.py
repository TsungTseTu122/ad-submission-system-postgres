from flask import Blueprint, render_template, request, redirect, url_for, flash, session, make_response
from werkzeug.security import generate_password_hash, check_password_hash
from app import get_db_connection
from datetime import date



bp = Blueprint('main', __name__)  # name your blueprint

# REGISTER (Client Only)
@bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        fname = request.form['firstname']
        lname = request.form['lastname']
        phone = request.form['phone']
        address = request.form['address']
        gender = request.form['gender']
        birth_date = request.form['birth_date']
        account_name = request.form['account_name']
        password = request.form['password']

        hashed_password = generate_password_hash(password)

        conn = get_db_connection()
        if conn is None:
            flash("Database connection failed. Please check server or credentials.")
            return redirect(url_for('main.register'))
        cur = conn.cursor()

        try:
            cur.execute("""
                INSERT INTO client (
                    firstname, lastname, phone_number, address, gender, birth_date, created_at, updated_at
                ) VALUES (%s, %s, %s, %s, %s, %s, NOW(), NOW())
                RETURNING client_id
            """, (fname, lname, phone, address, gender, birth_date))
            client_id = cur.fetchone()[0]

            cur.execute("""
                INSERT INTO client_credential (client_id, account_name, password_hash)
                VALUES (%s, %s, %s)
            """, (client_id, account_name, hashed_password))
            conn.commit()

            flash('Registered successfully! Please log in.')
            return redirect(url_for('main.client_login'))
        except Exception as e:
            flash(f"Registration failed: {e}")
        finally:
            cur.close()
            conn.close()
    max_birthdate = date.today().replace(year=date.today().year - 13).isoformat()
    return render_template('register.html', max_birthdate=max_birthdate)

# CLIENT LOGIN
@bp.route('/client-login', methods=['GET', 'POST'])
def client_login():
    if request.method == 'POST':
        username = request.form['username']
        password_input = request.form['password']

        conn = get_db_connection()
        if conn is None:
            flash("Database connection failed. Please check server or credentials.")
            return redirect(url_for('main.client_login'))

        cur = conn.cursor()
        cur.execute("SELECT client_id, password_hash FROM client_credential WHERE account_name = %s", (username,))
        result = cur.fetchone()
        
        cur.close()
        conn.close()

        if result and check_password_hash(result[1], password_input):
            session['user'] = username
            flash('Login successful!')
            return redirect(url_for('main.dashboard'))
        else:
            flash(" Incorrect username or password.")

    return render_template('client_login.html')

# Submit new ad request (Client only)
@bp.route('/submit-request', methods=['GET', 'POST'])
def submit_request():
    if 'user' not in session:
        flash("Please log in to submit a request.")
        return redirect(url_for('main.client_login'))

    if request.method == 'POST':
        budget = request.form.get('budget')
        description = request.form.get('description')

        try:
            budget = int(budget)
        except ValueError:
            flash("Budget must be a number.")
            return redirect(url_for('main.submit_request'))

        conn = get_db_connection()
        if conn is None:
            flash("Database connection failed.")
            return redirect(url_for('main.submit_request'))

        cur = conn.cursor()

        # Get client_id from session user
        cur.execute("SELECT client_id FROM client_credential WHERE account_name = %s", (session['user'],))
        result = cur.fetchone()
        if not result:
            flash("Client not found.")
            cur.close()
            conn.close()
            return redirect(url_for('main.submit_request'))

        client_id = result[0]

        # Insert into request table
        cur.execute("""
            INSERT INTO request (submission_date, budget, status, description, client_id)
            VALUES (%s, %s, %s, %s, %s)
        """, (date.today(), budget, "Pending", description, client_id))

        conn.commit()
        cur.close()
        conn.close()

        flash("Your request has been submitted!")
        return redirect(url_for('main.dashboard'))

    return render_template('submit_request.html')

# STAFF LOGIN
@bp.route('/staff-login', methods=['GET', 'POST'])
def staff_login():
    if request.method == 'POST':
        username = request.form['username']
        password_input = request.form['password']

        conn = get_db_connection()
        if conn is None:
            flash("Database connection failed. Please check server or credentials.")
            return redirect(url_for('main.staff_login'))
        
        cur = conn.cursor()
        cur.execute("SELECT ssn, password_hash FROM staff_credential WHERE account_name = %s", (username,))
        result = cur.fetchone()
        
        cur.close()
        conn.close()

        if result and check_password_hash(result[1], password_input):
            session['staff'] = username
            flash('Staff login successful!')
            return redirect(url_for('main.staff_panel'))
        else:
            flash('Invalid staff credentials.')

    return render_template('staff_login.html')

@bp.route('/update-status', methods=['POST'])
def update_status():
    if 'staff' not in session:
        flash('You must be logged in as staff to perform this action.')
        return redirect(url_for('main.staff_login'))

    request_no = request.form['request_no']
    new_status = request.form['status']

    conn = get_db_connection()
    cur = conn.cursor()

    try:
        cur.execute("""
            UPDATE request
            SET status = %s, updated_at = CURRENT_DATE
            WHERE request_no = %s
        """, (new_status, request_no))
        conn.commit()
        flash(f"Status for request {request_no} updated to '{new_status}'. ✅")  
    except Exception as e:
        flash(f"Error updating status: {e}")
    finally:
        cur.close()
        conn.close()

    return redirect(url_for('main.staff_panel'))


# DASHBOARD ROUTES
@bp.route('/dashboard')
def dashboard():
    if 'user' not in session:
        return redirect(url_for('main.client_login'))

    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute("SELECT client_id FROM client_credential WHERE account_name = %s", (session['user'],))
    result = cur.fetchone()

    if not result:
        flash("Client not found.")
        return redirect(url_for('main.client_login'))

    client_id = result[0]

    cur.execute("""
        SELECT request_no, submission_date, budget, status, description
        FROM request
        WHERE client_id = %s
        ORDER BY submission_date DESC
    """, (client_id,))
    
    requests = cur.fetchall()
    cur.close()
    conn.close()

    return render_template('client_dashboard.html', username=session['user'], requests=requests)

# staff panel
@bp.route('/staff-panel')
def staff_panel():
    if 'staff' not in session:
        return redirect(url_for('main.staff_login'))

    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT s.firstname, s.lastname, s.position
        FROM staff_credential sc
        JOIN staff s ON sc.ssn = s.ssn
        WHERE sc.account_name = %s
    """, (session['staff'],))
    staff_info = cur.fetchone()

    cur.execute("""
        SELECT r.request_no, r.submission_date, r.budget, r.status, r.description, cc.account_name
        FROM request r
        LEFT JOIN client c ON r.client_id = c.client_id
        LEFT JOIN client_credential cc ON c.client_id = cc.client_id
        ORDER BY r.submission_date DESC
    """)
    requests = cur.fetchall()
    cur.close()
    conn.close()

    rendered = render_template(
        'staff_panel.html',
        staff_name=f"{staff_info[0]} {staff_info[1]}",
        staff_position=staff_info[2],
        requests=requests
    )

    # Make a response and set headers
    response = make_response(rendered)
    response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, post-check=0, pre-check=0, max-age=0'
    response.headers['Pragma'] = 'no-cache'
    return response

@bp.route('/my-projects')
def my_projects():
    if 'staff' not in session:
        flash('Please login as staff.')
        return redirect(url_for('main.staff_login'))

    conn = get_db_connection()
    cur = conn.cursor()

    # Find staff SSN
    cur.execute("""
        SELECT ssn FROM staff_credential
        WHERE account_name = %s
    """, (session['staff'],))
    result = cur.fetchone()

    if not result:
        flash('Staff not found.')
        return redirect(url_for('main.staff_panel'))

    ssn = result[0]

    # Query projects assigned to the staff
    cur.execute("""
        SELECT p.project_no, p.start_date, p.due_date, p.description
        FROM project p
        JOIN assign_to a ON p.project_no = a.project_no
        WHERE a.ssn = %s
    """, (ssn,))
    projects = cur.fetchall()

    cur.close()
    conn.close()

    return render_template('my_projects.html', projects=projects)

@bp.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out.")
    return redirect(url_for('main.client_login'))


# Default page 
@bp.route('/')
def index():
    return redirect(url_for('main.client_login'))  

