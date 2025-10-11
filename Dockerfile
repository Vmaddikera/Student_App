FROM python:3.12.6-slim-buster
WORKDIR /app
COPY . /app

RUN apt update -y && apt install awscli -y

RUN pip install - requirements.txt

CMD["python", "app.py"]