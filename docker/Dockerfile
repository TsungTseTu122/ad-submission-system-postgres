# Base Python image
FROM python:3.10

# Set work directory
WORKDIR /app

# Copy all files from local project directory to /app inside container
COPY ../requirements.txt .


# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set default command
CMD ["python", "launch_server.py"]
