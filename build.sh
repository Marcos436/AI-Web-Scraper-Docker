#!/bin/bash

# Install minimal dependencies
apt-get update && apt-get install -y wget unzip

# Install Chromium browser (smaller than Chrome)
apt-get install -y chromium-browser

# Install ChromeDriver
CHROMEDRIVER_VERSION=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE)
wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip
unzip /tmp/chromedriver.zip -d /usr/local/bin/
chmod +x /usr/local/bin/chromedriver

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/chromedriver.zip

# Install Python dependencies
pip install -r requirements.txt

streamlit run main.py