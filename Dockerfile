FROM python:3.13-slim

# FFmpeg aur dependencies install karein
RUN apt-get update && apt-get install -y ffmpeg wget git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Requirements copy karein
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Baaki saara code copy karein
COPY . .

# Render ke liye command (Flask + Bot dono chalao)
CMD gunicorn app:app --bind 0.0.0.0:$PORT & python3 main.py
