#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define the root directory of the repository (one level up from the script)
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Define the output directory (one level up from the repository root)
OUTPUT_DIR="$(dirname "$REPO_DIR")"

# Define the output filename with the new format and current date
RELEASE_FILENAME="bop[v0.0.$(date "+%Y%m%d")].zip"

# Define the full path for the output zip file
OUTPUT_PATH="$OUTPUT_DIR/$RELEASE_FILENAME"

# Navigate to the repository root directory to zip its contents
cd "$REPO_DIR" || exit 1 # Exit if cd fails

echo "Changing directory to: $REPO_DIR"
echo "Creating release archive at: $OUTPUT_PATH"

# Create a zip archive of the current directory (.) and place it in OUTPUT_PATH
# -r : Recurse into directories
# $OUTPUT_PATH : The full path for the output zip file
# . : Zip the current directory (REPO_DIR)
# -x ".*" : Exclude hidden files/directories at the top level (e.g., .git, .env)
# -x "*/.*" : Exclude hidden files/directories within any subdirectory (e.g., somedir/.cache)
zip -r "$OUTPUT_PATH" . -x ".*" -x "*/.*"

# Optional: Check if the zip command was successful
if [ $? -eq 0 ]; then
  echo "Successfully created release archive: $OUTPUT_PATH"
else
  echo "Error creating release archive."
  # Optional: Navigate back to the original directory if needed
  # cd "$SCRIPT_DIR"
  exit 1
fi

# Optional: Navigate back to the original directory if needed
# cd "$SCRIPT_DIR"

echo "Script finished."

