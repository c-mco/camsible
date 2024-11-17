# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary packages as root
RUN apt update && apt install -y ansible git sudo zsh

# Create a new user named "camsible" and add it to the sudo group
RUN useradd -m -s /usr/bin/zsh camsible && echo "camsible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the new user
USER camsible
WORKDIR /home/camsible

# Copy the setup script and playbook into the container
COPY --chown=camsible:camsible setup-ubuntu.sh .

# Make the setup script executable
RUN chmod +x ./setup-ubuntu.sh

# Run the setup script during the build process
RUN ./setup-ubuntu.sh

# Set the default command to keep the container running
CMD ["/usr/bin/zsh"]