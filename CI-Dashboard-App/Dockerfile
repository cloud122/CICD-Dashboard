FROM python:3.11-slim

ENV FLASK_RUN_HOST=0.0.0.0

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
