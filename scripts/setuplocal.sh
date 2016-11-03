#!/bin/bash -e

# If we're cd'd on the scripts directory we just need to
# use the parent directory as base path.
# Otherwise the current path it's ok if you didn't execute
# this from weird places.
BASE_PATH="./"
if [ $(pwd) == *scripts* ]; then
    BASE_PATH="../"
fi

# Create a hidden directory for the python virtualenvs
echo "=> Check for virualenvs directory"
if [ ! -d "${BASE_PATH}.envs" ]; then
    mkdir ${BASE_PATH}.envs
fi

# Generate a virtualenv
echo "=> Create virtualenv"
if [ ! -d "${BASE_PATH}.envs/py35" ]; then
    virtualenv -p python3.5 ${BASE_PATH}.envs/py35
fi

# Activate the virtualenv
source $BASE_PATH.envs/py35/bin/activate

echo "=> Update base packages for the virtualenv"
pip install -U pip setuptools

# Install the requirements
echo "=> Install requirements"
pip install -r $BASE_PATH/requirements/local.txt

# Execute django commands
echo "=> Doing django migrations"
python src/manage.py migrate

# Deactivates the virtualenv
deactivate
