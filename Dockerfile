# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid user interaction during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages as root
RUN apt update && apt install -y ansible git sudo

# Create a new user
RUN useradd -ms /bin/bash cam

# Add the new user to the sudoers file
RUN echo 'cam ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create a directory for the cam user and set permissions
RUN mkdir -p /home/cam && chown -R cam:cam /home/cam

# Copy the setup script into the container
COPY setup-ubuntu.sh /home/cam/setup-ubuntu.sh

# Change ownership of the setup script to the new user
RUN chown cam:cam /home/cam/setup-ubuntu.sh

# Switch to the new user
USER cam

# Make the setup script executable
RUN chmod +x /home/cam/setup-ubuntu.sh

# Run the setup script
RUN /home/cam/setup-ubuntu.sh

