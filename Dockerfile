FROM python:3.9.13

RUN apt-get update && apt-get install -y libpq-dev build-essential
COPY requirements.txt ./requirements.txt
RUN python -m pip install -r ./requirements.txt --no-cache-dir
WORKDIR /

COPY . /

ENV PORT 5000

EXPOSE 5000

CMD ["python","initialize.py","&&","gunicorn", "-b","0.0.0.0:$PORT","gavel:app","-w","3"]
