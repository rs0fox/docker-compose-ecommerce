# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables to avoid buffering and to ensure that
# the Python output is immediately sent to the logs
ENV PYTHONUNBUFFERED=1

# Create a working directory
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install the required Python packages
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Ensure the entrypoint script is executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
