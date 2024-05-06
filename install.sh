#!/bin/bash

# Check if script is run with sudo
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root." 1>&2
    exit 1
fi

# Function to copy files
install_files() {
    cp "$1" "$2"
    if [ $? -ne 0 ]; then
        echo "Failed to copy $1 to $2" 1>&2
        exit 1
    fi
}

# Function to display installation success message
installation_success() {
    echo "Installation complete."
}

# Function to provide manual installation instructions
manual_installation() {
    echo "Manual installation steps:"
    echo "1. Make the script '$script_path' executable (usually chmod +x '$script_path')"
    echo "1. Copy '$script_path' to a directory in your PATH."
    echo "2. Copy the man page '$man_page_path' to the appropriate man page directory."
    echo "3. Update the man page database using the appropriate command for your system."
}

# Detect operating system and set installation variables accordingly
case "$(uname -s)" in
    Linux*)
        install_dir="/usr/local/bin"
        man_dir="/usr/share/man/man1"
        man_db_command="mandb"
    ;;
    Darwin*)
        install_dir="/usr/local/bin"
        man_dir="/usr/share/man/man1"
        man_db_command="makewhatis"
    ;;
    OpenBSD*)
        install_dir="/usr/local/bin"
        man_dir="/usr/share/man/man1"
        man_db_command="makewhatis"
    ;;
    *)
        echo "Unsupported operating system. Manual installation required."
        manual_installation
        exit 1
    ;;
esac

# Path to your script and man page
script_path="sleepuntil"
man_page_path="sleepuntil.1"

chmod +x $script_path

# Install the script
install_files "$script_path" "$install_dir"

# Install the man page
install_files "$man_page_path" "$man_dir"

# Update man page database
$man_db_command "$man_dir"

# Display installation success message
installation_success