# Start from the base image
FROM python:3.9-slim

# Install required packages
RUN apt-get update && \
    apt-get install -y netcat-openbsd python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file and install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint for the container
ENTRYPOINT ["/app/entrypoint.sh"]

# Expose the necessary port
EXPOSE 8000

# Default command to run the application
CMD ["python", "app.py"]
