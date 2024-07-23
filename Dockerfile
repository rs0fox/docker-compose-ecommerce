FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["python", "app.py"]
