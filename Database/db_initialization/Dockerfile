FROM alpine:latest

# Install PostgreSQL client
RUN apk add --no-cache postgresql-client

# Copy SQL scripts into the Docker image
COPY schema.sql /scripts/schema.sql
COPY seed.sql /scripts/seed.sql
COPY init-db.sh /scripts/init-db.sh

RUN chmod +x /scripts/init-db.sh
