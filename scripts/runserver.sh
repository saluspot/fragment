#!/bin/bash

# If we're cd'd on the scripts directory we just need to
# use the parent directory as base path.
# Otherwise the current path it's ok if you didn't execute
# this from weird places.
BASE_PATH="./"
if [ $(pwd) == *scripts* ]; then
    BASE_PATH="../"
fi

# Activate the virtualev
source ${BASE_PATH}.envs/py35/bin/activate

# Runserver!
python ${BASE_PATH}src/manage.py runserver 0.0.0.0:8082

# Deactivate the virtualenv
deactivate
