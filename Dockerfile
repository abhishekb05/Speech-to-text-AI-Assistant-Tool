# Use the official Python image from the Docker Hub
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app
# Install FFmpeg
RUN apt-get update && apt-get install -y ffmpeg
# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8501 for Streamlit
EXPOSE 8501

# Run app.py when the container launches
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
