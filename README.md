# AI Web Scraper using Langchain and GroqCloud (Llama3.1)

## Demo
![Screenshot 2024-10-03 125330](https://github.com/user-attachments/assets/c0a4d7b0-8051-4f36-9b77-c393b95dbeea)

This project is an **AI-powered Web Scraper** that leverages **Langchain**, **GroqCloud**, and **Llama3.1** to scrape, parse, and analyze content from web pages. The project is made using **Streamlit** and containerized using **Docker** and deployed on **Vercel** for scalability and ease of access.

## Features
- Uses **Langchain** for conversational and generative AI capabilities.
- Integrates with **GroqCloud** and the **Llama3.1 model** for powerful language understanding.
- Scrapes and parses web content based on user input on **Streamlit**.
- Deployed using **Docker** for containerized execution on **Vercel**.

## Project Structure

```bash
.
├── Dockerfile             # Docker setup for the app
├── main.py                # The main entry point of the Streamlit app
├── parse.py               # Contains the logic for handling user input and parsing web content
├── requirements.txt       # Python dependencies
├── vercel.json            # Configuration for deployment on Vercel
└── .env                   # Environment variables (API keys, etc.)
```

## Requirements

To run this project, you need the following dependencies listed in the `requirements.txt`:

```
groq
streamlit
langchain
langchain_core
langchain_groq
selenium
beautifulsoup4
lxml
html5lib
python-dotenv
```

## Environment Variables

The project uses environment variables stored in a `.env` file. Ensure you add your keys for **GroqCloud** and **other services** as needed.

Example `.env` file:

```bash
GROQ_API_KEY=your_groq_api_key
or
HUGGINGFACEHUB_API_TOKEN = your_HuggingFace_API_TOKEN
```

## How to Run Locally

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-repo/ai-web-scraper.git
   cd ai-web-scraper
   ```

2. **Set up the environment**:
   - Create a `.env` file with your API keys as shown above.

3. **Install the dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the Streamlit app**:
   ```bash
   streamlit run main.py
   ```

## Docker Setup
To containerize the app, a **Dockerfile** is provided. This Dockerfile installs all necessary dependencies, sets up ChromeDriver for scraping, and runs the Streamlit app.
### Build the Docker Image

```bash
docker build -t ai-web-scraper .
```

### Run the Docker Container

```bash
docker run -p 8501:8501 ai-web-scraper
```

The app will be accessible at `http://localhost:8501` inside the container.

This project is deployed on **Vercel** using Streamlit and Docker. 

   
