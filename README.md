README.md

# Email Sender POC

This is a proof of concept (POC) project for sending emails using the Gmail API.

## Prerequisites

- Python 3.x installed on your system.
- `pip` package manager installed.
- Access to a Gmail account.

## Installation

1. Clone this repository to your local machine:

```python
git clone https://github.com/your-username/email-sender-cli.git
```

2. Navigate to the project directory:

```python
cd email-sender-cli
```

3. Install dependencies:

```python
pip install -r requirements.txt
```

## Usage

## Setup Google Developer Console

1. Go to the [Google Developer Console](https://console.developers.google.com/).
2. Create a new project.
3. Enable the Gmail API for your project.
4. Create OAuth 2.0 credentials (client ID and client secret).
5. Download the credentials JSON file and save it as `credentials.json` in the project root directory.

### Update Email Content

1. Open the `email.txt` file located in the project root directory.
2. Update the content of the email with your desired message.
3. Save and close the file.

### Shell Script (Linux/Mac)

Run the shell script `run.sh` with the following command:

```python
./run.sh --file email.txt --sender sender@example.com --to recipient@example.com --subject "Your Subject Here"
```

bash

### Batch File (Windows)

Run the batch file `run.bat` with the following command:

```python
run.bat --file email.txt --sender sender@example.com --to recipient@example.com --subject "Your Subject Here"
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
These instructions guide users to update the email.txt file with their desired email content before running the scripts. This ensures that users can customize the email message according to their needs.
