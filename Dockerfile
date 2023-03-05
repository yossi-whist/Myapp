FROM python:3.9-alpine3.12

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD ["python3", "-m", "flask", "--app", "main.py", "run", "--host=0.0.0.0", "--port=80"]