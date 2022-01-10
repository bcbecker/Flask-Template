#!/bin/bash
################################################################################
#                              Flask App Template                              #
#                                                                              #
# This script creates a basic Flask app with best practices file structure     #
# and starter template code to get your project off the ground quicker.        #
#                                                                              #
# Change History                                                               #
# 12/18/2021  bcbecker    Original code.                                       #
# 12/27/2021  bcbecker    Fixed init files for app vs api, added tests         #
# 01/10/2022  bcbecker    Separated input text into template files             #
#                                                                              #
#                                                                              #
################################################################################


################################################################################
################################ VARIABLES #####################################
################################################################################

#set the working dir relative to the current dir
WORKDIR="../../Software Dev/Python Projects/Flask/"

FLASK_APP_NAME="flask_server"

CONFIG_TEXT=$(<template_files/config.txt)

ENV_TEXT=$(<template_files/env.txt)

RUN_TEXT=$(<template_files/run.txt)

REQUIREMENTS_TEXT=$(<template_files/requirements.txt)

APP_INIT_TEXT=$(<template_files/app/app_init.txt)

APP_MODELS_TEXT=$(<template_files/app/app_models.txt)

TEST_INIT_TEXT=$(<template_files/tests/test_init.txt)

TEST_TEST_APP_TEXT=$(<template_files/tests/test_test_app.txt)

API_INIT_TEXT=$(<template_files/app/api/api_init.txt)

API_ROUTES_TEXT=$(<template_files/app/api/api_routes.txt)

################################################################################
############################## START COMMANDS ##################################
################################################################################

#change to working dir, print to console
cd "$WORKDIR"
echo "Working dir:" 
pwd

echo "Creating files..."
#create outer dir
mkdir "$FLASK_APP_NAME"
cd "$FLASK_APP_NAME"

#create tests dir
mkdir tests
cd tests
touch __init__.py
touch test_app.py
#write to those files:
echo "$TEST_INIT_TEXT" > __init__.py
echo "$TEST_TEST_APP_TEXT" > test_app.py

#make app dir and files
cd ..
mkdir app
touch config.py
touch .env
touch run.py
touch requirements.txt
#write to those files:
echo "$CONFIG_TEXT" > config.py
echo "$ENV_TEXT" > .env
echo "$RUN_TEXT" > run.py
echo "$REQUIREMENTS_TEXT" > requirements.txt

#enter app, create init/models
cd app
touch __init__.py
touch models.py
#write to those files:
echo "$APP_INIT_TEXT" > __init__.py
echo "$APP_MODELS_TEXT" > models.py

#create api dir, enter api dir
mkdir api
cd api
#create init, routes
touch __init__.py
touch routes.py
#write to text files
echo "Writing to files..."
echo "$API_INIT_TEXT"  > __init__.py 
echo "$API_ROUTES_TEXT" > routes.py


echo "Creation successful"
#END
