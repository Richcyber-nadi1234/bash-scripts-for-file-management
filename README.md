# bash-scripts-for-file-management
Write bash scripts for file management and user password policies. 

# EC2 File Management and Password Policy Scripts

This repository contains two Bash scripts designed for managing files and enforcing password policies on an AWS EC2 instance. These scripts help automate file archiving and ensure users update their passwords regularly.

## Scripts

### 1. File Management Script

**Script Name:** `file_management.sh`

**Objective:** Moves files that have not been accessed in the last 90 days to an "archives" directory, excluding `.sh` files.

**Usage:**

1. **Configure the Script:**
   - Open the script in a text editor and modify the `SOURCE_DIR` and `ARCHIVES_DIR` variables to match your directories.

     ```bash
     SOURCE_DIR="/path/to/source"
     ARCHIVES_DIR="/path/to/archives"
     ```

2. **Run the Script:**
   - Make the script executable:
     ```bash
     chmod +x file_management.sh
     ```
   - Execute the script:
     ```bash
     ./file_management.sh
     ```

**Example Configuration:**

```bash
SOURCE_DIR="/home/ec2-user/source"
ARCHIVES_DIR="/home/ec2-user/archives"

Notes:

Ensure you have the necessary permissions to move files and create directories.
This script uses find to locate files and mv to move them. Ensure the directories exist or adjust the script to create them.
2. Password Policy Script
Script Name: password_policy.sh

Objective: Prompts users with passwords older than 90 days to change them on their next login.

Usage:

Run the Script:
Make the script executable:

chmod +x password_policy.sh
Execute the script:  ./password_policy.sh

Notes:

The script uses chage to check and modify password expiration dates. Ensure you have the necessary permissions to modify user accounts.
System users (UID < 1000) are excluded from processing. Adjust the script if needed based on your system's user management policies.


Requirements
Bash shell (available by default on most Linux distributions)
find, mv, chage, and date commands (commonly available on Unix-like systems)
Example Output
File Management Script:Moved /home/ec2-user/source/oldfile.txt to /home/ec2-user/archives
User john_doe is required to change their password on next login.
Password Policy Script:User john_doe is required to change their password on next login.


License
This project is licensed under the MIT License. See the LICENSE file for details.

Contributing
If you have suggestions or improvements, feel free to open an issue or submit a pull request. Contributions are welcome!

Contact
For any questions or issues, please contact Nadi Joseph.
