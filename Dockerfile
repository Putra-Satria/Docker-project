# Use an official Python image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files into the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir flask

# If you have a requirements.txt file, use:
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expose the port Flask runs on
EXPOSE 5000

# Command to run your app
CMD ["flask", "run"]
