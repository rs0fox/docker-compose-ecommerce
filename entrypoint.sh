#!/bin/sh
# Wait until PostgreSQL is ready
while ! nc -z db 5432; do
  echo "Waiting for PostgreSQL..."
  sleep 1
done

# Navigate to the correct directory
cd /app

# Start the application
exec "$@"
