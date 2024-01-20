FROM python:3.10-slim

RUN apt-get update && apt-get -y install build-essential
RUN pip install poetry==1.4.2

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /opt/dagster/app

COPY pyproject.toml poetry.lock ./
RUN touch README.md
RUN poetry install --without dev --no-root && rm -rf $POETRY_CACHE_DIR

COPY dbt_pipelines ./dbt_pipelines
COPY ../pipelines ./dbt_pipelines/pipelines
RUN poetry install --without dev
