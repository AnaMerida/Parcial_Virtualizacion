FROM python:3.10-alpine

WORKDIR /app

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY app.py .

EXPOSE 8000

CMD ["python3", "app.py"]
