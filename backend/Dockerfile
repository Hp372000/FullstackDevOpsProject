# Stage 1: Build the binary
FROM golang:1.22-alpine AS builder

# Set working directory inside container
WORKDIR /app

# Copy go.mod and download dependencies
COPY go.mod ./
RUN go mod download

# Copy source code
COPY main.go .

# Build the Go app
RUN go build -o backend-app

# Stage 2: Build the runtime image
FROM alpine:latest

# Set working directory
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/backend-app .

# Expose the app port
EXPOSE 8080

# Command to run
CMD ["./backend-app"]
