# Use official Python image
FROM python:3.9

# Copy the app.py file into the container
COPY app.py /app.py

# Run the script when the container starts
CMD ["python", "/app.py"]
