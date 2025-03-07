# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application code
COPY app.py /app/app.py

# Install dependencies
RUN pip install flask pytest  # Add pytest here

# Command to run the application
CMD ["python", "app.py"]
