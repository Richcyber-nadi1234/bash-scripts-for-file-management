#!/bin/bash

# Directory to check and the archives directory
SOURCE_DIR="/path/to/source"
ARCHIVES_DIR="/path/to/archives"

# Create the archives directory if it does not exist
if [ ! -d "$ARCHIVES_DIR" ]; then
    mkdir -p "$ARCHIVES_DIR"
fi

# Find files not accessed in the last 90 days, ignoring .sh files
find "$SOURCE_DIR" -type f ! -name "*.sh" -atime +90 -print0 | while IFS= read -r -d '' file; do
    # Move each file to the archives directory
    mv "$file" "$ARCHIVES_DIR"
    echo "Moved $file to $ARCHIVES_DIR"
done
