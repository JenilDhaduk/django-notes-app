FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Install system dependencies needed for mysqlclient
RUN apt-get update && \
    apt-get install -y gcc default-libmysqlclient-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Copy requirement file and install dependencies
COPY requirements.txt /app/backend/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . /app/backend

# Expose Django port
EXPOSE 8000

# Run Django dev server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
