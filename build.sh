
sudo apt-get update
sudo apt-get install -y wget gnupg
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable

#!/bin/bash

# Update package list and install system dependencies
sudo apt-get update && sudo apt-get install -y \
    wget \
    unzip \
    curl \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    default-jdk

# Remove unused apt list
sudo rm -rf /var/lib/apt/lists/*

# Install Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update && sudo apt-get install -y google-chrome-stable

# Install ChromeDriver
wget -O /tmp/chromedriver.zip https://storage.googleapis.com/chrome-for-testing-public/129.0.6668.89/linux64/chromedriver-linux64.zip
sudo unzip /tmp/chromedriver.zip -d /usr/local/bin/
rm /tmp/chromedriver.zip

# Ensure pip is installed and upgrade to the latest version
python3 -m ensurepip --upgrade
pip install --upgrade pip

# Install Python dependencies from requirements.txt
pip install -r requirements.txt

# Expose port 8501 and run the Streamlit app
streamlit run main.py
