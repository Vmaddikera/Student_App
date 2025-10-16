FROM python:3.11-slim-buster

WORKDIR /app
COPY . /app

# Update sources.list to use the Debian archive for buster
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    apt-get update -o Acquire::Check-Valid-Until=false -y && \
    apt-get install -y awscli

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]