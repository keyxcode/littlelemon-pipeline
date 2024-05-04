FROM python:3.9-alpine

WORKDIR /usr/src/app/
EXPOSE 8000

RUN apk update && \
    apk add --no-cache python3 python3-dev py3-pip && \
    pip3 install --upgrade pip
COPY requirements.txt ./
RUN pip install -r requirements.txt

ARG DB_CONNECTION
ENV DB_CONNECTION $DB_CONNECTION
COPY . .

CMD python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000
