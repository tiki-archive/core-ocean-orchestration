FROM python:3.10-slim

RUN apt-get update && apt-get -y install build-essential
RUN pip install poetry==1.4.2

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /opt/dagster/app

COPY  macros \
    models \
    seeds \
    dbt_project.yml \
    dependencies.yml \
    package-lock.yml \
    profiles.yml \
    orchestration/pyproject.toml \
    orchestration/poetry.lock \
    orchestration/dagster_cloud.yaml \
    ./

RUN cd orchestration && poetry install --without dev --no-root && rm -rf $POETRY_CACHE_DIR

COPY orchestration/dbt_pipelines ./orchestration/dbt_pipelines
RUN cd orchestration && poetry install --without dev
