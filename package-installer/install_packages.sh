#!/bin/bash

# Define the log file
LOG_FILE="install.log"
> $LOG_FILE

# Detect the package manager
if command -v apt > /dev/null 2>&1; then
    PACKAGE_MANAGER="apt"
    INSTALL_CMD="sudo apt install -y"
elif command -v yum > /dev/null 2>&1; then 
    PACKAGE_MANAGER="yum"
    INSTALL_CMD="sudo yum install -y"
elif command -v pacman > /dev/null 2>&1; then
    PACKAGE_MANAGER="pacman"
    INSTALL_CMD="sudo pacman -S --noconfirm"
else
    echo -e "\nNo supported package manager found." | tee -a $LOG_FILE
    exit 1
fi

echo -e "\nPackage manager detected: $PACKAGE_MANAGER" | tee -a $LOG_FILE

# Check if packages.txt exists
if [ ! -f packages.txt ]; then
    echo -e "\npackages.txt file not found!" | tee -a $LOG_FILE
    exit 1
fi

# Install each package
while IFS= read -r package; do
    if [ -z "$package" ]; then continue; fi

    # Check if package is already installed
    if dpkg -l | grep -qw "$package"; then
    echo "✅ Already installed: $package" | tee -a "$LOG_FILE"
    continue
    fi

    echo -e "\nInstalling $package" | tee -a $LOG_FILE
    read -p "Confirm installation of $package? (y/n): " confirm
    confirm=${confirm,,} # Convert to lowercase

    if [[ "$confirm" =~ ^(n|no)$ ]]; then
        echo -e "\nSkipping $package" | tee -a $LOG_FILE
        continue
    fi

    echo "Installing $package" | tee -a $LOG_FILE
    if $INSTALL_CMD "$package" >> $LOG_FILE 2>&1; then
        echo -e "\n$package installed successfully" | tee -a $LOG_FILE
    else
        echo -e "\nFailed to install $package" | tee -a $LOG_FILE
    fi

done < packages.txt

echo -e "\nInstallation finished. Check $LOG_FILE for details."