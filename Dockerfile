# Use a base image with Python and scientific computing libraries
FROM python:3.8-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set up the working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Set the default command to run when the container starts
CMD ["python", "main.py"]
