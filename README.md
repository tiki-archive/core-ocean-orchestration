# Core Ocean Orchestration

This repo contains the [dagster](https://dagster.io) orchestration for the ocean dbt [data pipelines](https://github.com/tiki/core-ocean-pipelines)

## Dependencies

To work locally with these projects, you only need 3 things:

- Python 3.10 or greater: minimum Python version is set to 3.10
- [poetry](https://python-poetry.org/docs/#installation): for managing Python deps and venvs

## Usage

Launching the Dagster UI is the quickest way to get started:

```
$ cd dagster project
$ poetry install
$ export DAGSTER_HOME=$(pwd)/dagster-data
$ poetry run dagster dev
```

This will automatically run `dbt compile` and load all the assets into a global graph.

You can click on individual assets and click "Materialize selected" to materialize them.
