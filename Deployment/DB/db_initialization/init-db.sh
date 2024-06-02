#!/bin/sh
set -e
set -x  # Enable debugging

export PGPASSWORD=$POSTGRES_PASSWORD

echo "Starting init-db.sh script..."

# Check if PostgreSQL is up and accepting connections
while ! pg_isready -h "$DB_HOST" -U "$POSTGRES_USER" -d "postgres"; do
  echo "PostgreSQL is not ready yet. Sleeping for 2 seconds..."
  sleep 2
done

echo "$(date) - PostgreSQL is ready. Creating database and tables..."

# Create the database
#PGPASSWORD="$POSTGRES_PASSWORD" psql -h "$DB_HOST" -U "$POSTGRES_USER" -d "postgres" -c "DROP DATABASE IF EXISTS $POSTGRES_DB;"
psql -h "$DB_HOST" -U "$POSTGRES_USER" -d "postgres" -tc "SELECT 1 FROM pg_database WHERE datname = '$POSTGRES_DB'" | grep -q 1 || psql -h "$DB_HOST" -U "$POSTGRES_USER" -d "postgres" -c "CREATE DATABASE $POSTGRES_DB;"
PGPASSWORD=$POSTGRES_PASSWORD psql -h "$DB_HOST" -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /scripts/schema.sql
PGPASSWORD=$POSTGRES_PASSWORD psql -h "$DB_HOST" -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /scripts/seed.sql


echo "Database initialization complete."
