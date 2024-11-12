FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    ansible \
    sudo \
    curl \
    git \
    zsh \
    && apt-get clean

# Create a non-root user
RUN useradd -m -s /bin/zsh cam && echo "cam:password" | chpasswd && adduser cam sudo

# Allow the ansible user to use sudo without a password
RUN echo "cam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set the working directory
WORKDIR /home/cam

# Copy the Ansible playbook and roles
COPY . /home/cam/

# Change ownership of the copied files
RUN chown -R cam:cam /home/cam/

# Add a custom prompt to .zshrc
RUN echo 'PROMPT="%n@ansible-container %~ %# "' >> /home/cam/.zshrc

# Switch to the non-root user
USER cam

# Run the Ansible playbook
CMD ["ansible-playbook", "cams.yml"]