# Python base image based on Debian
FROM python:3.11-slim

# Define the work directory correctly
WORKDIR /app

# Only copy the necessary files for running the app
COPY setup.py setup.py
COPY hello hello

# Default flask server is good for development but not for production for security reasons.
RUN pip install --no-cache-dir . && pip install gunicorn

# By default, gunicorn exposes the app in port 8000.
EXPOSE 8080
CMD ["gunicorn", "-b", "0.0.0.0:8080", "hello:create_app()"]