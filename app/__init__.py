from flask import Flask
import psycopg2
from psycopg2 import OperationalError
import os

app = Flask(__name__)

app.secret_key = 'supersecret' # set a secret key for sessions

# Load database connection settings from environment 
DB_HOST = os.getenv('DB_HOST', 'database')
DB_NAME = os.getenv('DB_NAME', 'ad_platform_db')
DB_USER = os.getenv('DB_USER', 'admin')
DB_PASS = os.getenv('DB_PASS', 'admin111')

def get_db_connection():
    """Create a new database connection."""
    try:
        return psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASS
        )
    except OperationalError as e:
        # Log the error details for debugging
        print(f"Database connection failed: {e}")
        return None


# Import and register routes (using Blueprint)
from app.routes import bp  # import Blueprint
app.register_blueprint(bp)  # register it with the app
