# Use an official Python image as base
FROM python:3.9-slim

# Set working directory inside container
WORKDIR /app

# Copy only the dependency file first (for cache benefit)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app code
COPY . .

# Expose port the app will run on
EXPOSE 5001

# Run the Flask app
CMD ["python", "app.py"]
