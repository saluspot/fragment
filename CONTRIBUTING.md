Contributing guide
==================

# Running the project locally
## Setup local development environment

Execute the script as follows:

```
$ scripts/setuplocal.sh
```

- Creates a folder for the python virtual environments.
- Create a main virtualenv for the developer to use.
- Install the local requirements from `requirements/local.txt`.
- Updates pip and setuptools.
- Migrates the database

## Run a local copy of the project

Execute the script as follows:

```
$ scripts/runserver.sh
```

This just enables the virtualenv and executes `python src/manage.py runserver 0.0.0.0:8082`.