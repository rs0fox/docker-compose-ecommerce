#!/bin/sh

# Wait for the PostgreSQL and Redis services to be available
while ! nc -z db 5432; do
  echo "Waiting for PostgreSQL..."
  sleep 1
done

while ! nc -z redis 6379; do
  echo "Waiting for Redis..."
  sleep 1
done

# Run migrations or other setup tasks here if needed

# Start the Flask application
exec "$@"
