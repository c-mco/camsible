# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary packages as root
RUN apt update && apt install -y ansible git sudo

# Copy the setup script into the container
COPY setup-ubuntu.sh .

# Make the setup script executable
RUN chmod +x setup-ubuntu.sh

# Run the setup script
RUN ./setup-ubuntu.sh

