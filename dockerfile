FROM python:3.6

# Set Environment Variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Keep website files separate from rest of container files
WORKDIR /website

# Run pip install before copying rest of files to help caching
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy website files
COPY . .

# Listen on port 8000
EXPOSE 80

# Set up entrypoint to allow for all the django management commands
ENTRYPOINT [ "python3", "manage.py" ]
# ENTRYPOINT ["gunicorn", "bigday" ]