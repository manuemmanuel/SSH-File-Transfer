#!/bin/bash

install_openssh() {
    echo "Installing OpenSSH Server..."
    sudo apt update
    sudo apt install -y openssh-server

    if [ $? -eq 0 ]; then
        echo "OpenSSH Server installed successfully."
    else
        echo "Failed to install OpenSSH Server."
    fi
}

get_ip_address() {
    ip addr show | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d/ -f1
}

copy_file_scp() {
    echo "Enter the destination IP address:"
    read destination_ip

    echo "Enter the username on the destination computer:"
    read username

    echo "Enter the path to the file you want to copy:"
    read file_path

    echo "Enter the destination directory on the remote computer:"
    read destination_dir

    scp "$file_path" "$username@$destination_ip:$destination_dir"

    if [ $? -eq 0 ]; then
        echo "File copied successfully."
    else
        echo "Failed to copy the file."
    fi
}

access_ssh() {
    echo "Enter the destination IP address:"
    read destination_ip

    echo "Enter the username on the destination computer:"
    read username

    ssh "$username@$destination_ip"
}

echo "Your IP address is: $(get_ip_address)"

echo "What would you like to do?"
echo "1. Install OpenSSH Server"
echo "2. Copy a file using SCP"
echo "3. Access a remote computer via SSH"
read -p "Enter your choice (1, 2, or 3): " choice

case $choice in
    1)
        install_openssh
        ;;
    2)
        copy_file_scp
        ;;
    3)
        access_ssh
        ;;
    *)
        echo "Invalid choice."
        ;;
esac
