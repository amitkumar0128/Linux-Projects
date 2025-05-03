# User Account Creator 👤

A simple Bash script to create Linux user accounts from a CSV file.

## 📁 CSV Format

```csv
username,password
john,SecureP@ss1
alice,StrongP@ss2

## 🚀 Usage

```bash
chmod +x user_creator.sh
sudo ./user_creator.sh
```

## ⚠️ Requirements

Run as root or with sudo
users.csv must be in the same folder

## 💡 Improvements
 
-Generate strong passwords automatically
-Save passwords to a secure file
-Add user to specific groups
-Add logging to a file

## 📂 Sample Output
```
✅ Created user: john
✅ Created user: alice
User bob already exists. Skipping.
```

## Author - Amitkumar