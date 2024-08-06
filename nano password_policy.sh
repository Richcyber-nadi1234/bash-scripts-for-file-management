#!/bin/bash

# Get the current date in days since epoch
CURRENT_DATE=$(date +%s)

# Set the threshold for password age in days
PASSWORD_AGE_THRESHOLD=90

# Iterate over each user in the system
getent passwd | while IFS=: read -r username _ uid _ _ _; do
    # Skip system users (e.g., UID < 1000)
    if [ "$uid" -lt 1000 ]; then
        continue
    fi

    # Get the last password change date (in days since epoch)
    LAST_PASSWORD_CHANGE=$(chage -l "$username" | grep "Last password change" | awk -F: '{print $2}' | xargs -I{} date -d {} +%s)

    if [ -z "$LAST_PASSWORD_CHANGE" ]; then
        echo "Could not retrieve password change information for $username."
        continue
    fi

    # Calculate the age of the password in days
    PASSWORD_AGE=$(( (CURRENT_DATE - LAST_PASSWORD_CHANGE) / 86400 ))

    # Check if the password age exceeds the threshold
    if [ "$PASSWORD_AGE" -ge "$PASSWORD_AGE_THRESHOLD" ]; then
        # Set password expiration to force a change at the next login
        chage -d 0 "$username"
        echo "User $username is required to change their password on next login."
    fi
done
