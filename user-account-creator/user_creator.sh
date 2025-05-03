#!/bin/bash

INPUT="users.csv"

if [ ! -f "$INPUT" ]; then
    echo "CSV file $INPUT not found!"
    exit 1
fi

while IFS=, read -r username password; 
do 
    # Skip header line
    if [ "$username" == "username" ]; then
        continue
    fi

    # Check if user exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists. Skipping."
    else
        # Create user
        useradd -m "$username"

        # Set password
        echo "$username:$password" | chpasswd

        echo "✅ User $username created successfully."
    fi

done < "$INPUT"