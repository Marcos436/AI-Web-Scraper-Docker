# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    default-jdk \
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y chromium-browser

# Install ChromeDriver
RUN wget -O /tmp/chromedriver.zip https://storage.googleapis.com/chrome-for-testing-public/129.0.6668.89/linux64/chromedriver-linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver.zip

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip

# Install Python dependencies from requirements.txt
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Expose port for Streamlit
EXPOSE 8501

# Command to run Streamlit app
CMD ["streamlit", "run", "main.py"]
