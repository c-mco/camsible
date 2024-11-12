# camsible: My Personalized Ansible Playbook

This repository houses my meticulously crafted Ansible playbook, designed to automate the setup and configuration of my development environment. With camsible, I can effortlessly provision new machines or containers, ensuring consistency and efficiency across all my systems.

## Features

- Installs essential development tools (git, curl, zsh, tmux, stow, neovim)
- Sets up Oh My Zsh for a delightful shell experience
- Configures tmux for a productive terminal workflow
- Installs the GitHub CLI for seamless interaction with GitHub
- Manages dotfiles with Stow for organized and version-controlled configurations

## Prerequisites

- Ansible must be installed on your system. You can install it using pip:
  ```sh
  pip install ansible

## Usage

1. Clone this repository: `git clone https://github.com/c-mco/camsible.git`
2. Navigate to the camsible directory: `cd camsible`
3. Run the playbook: `ansible-playbook cams.yml`

## Customization

Feel free to adapt this playbook to your own needs and preferences. You can modify the tasks, add new roles, or customize the dotfiles to create your ideal development environment.

## Contributing

If you have any suggestions or improvements, feel free to open an issue or submit a pull request. Let's make camsible even more awesome together!