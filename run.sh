#!/bin/bash

# Function to display help
show_help() {
    echo "Usage: ./process_args.sh --file <file> --sender <email> --to <email> --subject <subject>"
    echo
    echo "Options:"
    echo "  --file <file>      Path to the text file"
    echo "  --sender <email>   Sender email address"
    echo "  --to <email>       Recipient email address"
    echo "  --subject <subject> Subject of the email"
    echo "  -h, --help         Show this help message"
}

# Initialize variables
FILE=""
SENDER=""
TO=""
SUBJECT=""

# Process options and arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --file)
            FILE="$2"
            shift 2
            ;;
        --sender)
            SENDER="$2"
            shift 2
            ;;
        --to)
            TO="$2"
            shift 2
            ;;
        --subject)
            SUBJECT="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Check if all required arguments are provided
if [ -z "$FILE" ] || [ -z "$SENDER" ] || [ -z "$TO" ] || [ -z "$SUBJECT" ]; then
    echo "Error: Missing required arguments."
    show_help
    exit 1
fi

# Delete the token.json file
if [ -f "token.json" ]; then
    rm "token.json"
    echo "Deleted token.json file."
else
    echo "No token.json file found to delete."
fi

# Create and activate virtual environment
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "Created virtual environment."
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
source venv/bin/activate
echo "Activated virtual environment."

# Install dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    echo "Installed dependencies from requirements.txt."
else
    echo "No requirements.txt file found."
fi

# Run the main.py script with the provided arguments
python3 main.py --file "$FILE" --sender "$SENDER" --to "$TO" --subject "$SUBJECT"
