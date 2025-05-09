# 🧰 Linux Package Installer Tool

This script simplifies the installation of multiple software packages across various Linux distributions. It checks for the presence of each package, prompts the user, and logs all actions taken. Supports **APT**, **YUM**, and **Pacman** package managers.

---

## 📁 Project Structure

```yaml
package-installer/
├── install_packages.sh # Main script
├── packages.txt # List of packages to install (one per line)
├── install.log # Auto-generated log file
└── README.md
```

---

## 📦 Features

- ✅ Detects your package manager (`apt`, `yum`, `pacman`)
- ✅ Updates package list before installation
- ✅ Skips packages that are already installed
- ✅ Asks for confirmation before installing
- ✅ Logs the entire session (`install.log`)
- ✅ Easy to extend or automate

---

## 📄 packages.txt Format

Add one package per line:

```
curl
git
htop
```

No trailing commas or spaces.

---

## 🚀 Usage

1. Make the script executable:

```bash
chmod +x install_packages.sh
./install_packages.sh
```

Follow the prompts to install desired tools.

---

## 📒 Notes

- If packages.txt has Windows-style line endings (\r\n), use:
```bash
dos2unix packages.txt
```
or include ```package=$(echo "$package" | tr -d '\r')``` inside the script.

- Use this in automation pipelines by tweaking for --silent or --auto modes.

---

## Author 

Built by Amitkumar