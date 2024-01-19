FROM python:3.10-slim

WORKDIR /opt/dagster/app
COPY . /opt/dagster/app

RUN pip install -e .
