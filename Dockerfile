FROM python:3.9

WORKDIR /usr/src/app/
EXPOSE 8000

RUN pip install --upgrade pip && pip install pipenv
COPY Pipfile* ./
RUN pipenv install --system

COPY . .

RUN python3 manage.py makemigrations
RUN python3 manage.py migrate

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
