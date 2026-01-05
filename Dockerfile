FROM debian:bullseye-slim

# Install required libraries for CGO and SQLite
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libsqlite3-0 \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy the binary
COPY uk-rail-schedule-api /app/

# Copy config
COPY config.yaml /app/

# Expose port
EXPOSE 3333

# Run the application
CMD ["./uk-rail-schedule-api"]