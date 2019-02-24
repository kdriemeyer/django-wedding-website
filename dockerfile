FROM python:3.6

WORKDIR /website

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
EXPOSE 8080

ENTRYPOINT [ "python3", "manage.py" ]