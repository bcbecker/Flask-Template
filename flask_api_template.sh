#!/bin/bash
################################################################################
#                              Flask App Template                              #
#                                                                              #
# This script creates a basic Flask app with best practices file structure     #
# and starter template code to get your project off the ground quicker.        #
#                                                                              #
# Change History                                                               #
# 12/18/2021  bcbecker    Original code.                                       #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################


#set the working dir relative to the current dir
WORKDIR="../Python Projects/Flask/"

FLASK_APP_NAME="flask_app"

CONFIG_TEXT="import os


class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY')
    FLASK_APP = os.environ.get('FLASK_APP')
    DEBUG = True
    TESTING = False

    SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI')
    SQLALCHEMY_TRACK_MODIFICATIONS = False


class ProductionConfig(Config):
    #SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL').replace('postgres://', 'postgresql://')
    FLASK_ENV = 'production'
    SESSION_COOKIE_SECURE = True
    SESSION_COOKIE_HTTPONLY = True
    REMEMBER_COOKIE_SECURE = True
    REMEMBER_COOKIE_HTTPONLY = True
    DEBUG = False

class DevelopmentConfig(Config):
    FLASK_ENV = 'development'
    DEBUG = True

class TestingConfig(Config):
    TESTING = True"


ENV_TEXT="SECRET_KEY=
FLASK_APP=run.py
SQLALCHEMY_DATABASE_URI=sqlite:///<DB_NAME>.db"

RUN_TEXT="from app.api import create_app

app = create_app()

if __name__ == \"__main__\":
    app.run()"

APP_INIT="#For packaging"

API_INIT="from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from config import Config


db = SQLAlchemy()
bcrypt = Bcrypt()


def create_app(config_class=Config):
    '''
    Binds all necessary objects to app instance, registers blueprints, configs from .env
    '''
    app = Flask(__name__)
    app.config.from_object(config_class)

    #Bind any packages here
    db.init_app(app)
    bcrypt.init_app(app)

    #Register any blueprints here
    from .routes import auth
    app.register_blueprint(auth)

    return app"

MODELS_TEXT="from . import db


class User(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    public_id = db.Column(db.String(50), unique = True)
    name = db.Column(db.String(100))
    email = db.Column(db.String(70), unique = True)
    password = db.Column(db.String(80))"


ROUTES_TEXT="from flask import request, jsonify, make_response, Blueprint
from . import db, bcrypt
from .models import User
  

auth = Blueprint('auth', __name__)

  
@auth.route('/signup', methods =['POST'])
def signup():
    return make_response(jsonify({'user' : 'test'}), 201)


@auth.route('/login', methods =['POST'])
def login():
    return make_response(jsonify({'user' : 'test'}), 200)"

################################################################################
############################## START COMMANDS ##################################
################################################################################

#change to working dir, print to console
cd "$WORKDIR"
echo "Working dir:" 
pwd

echo "Creating files..."
# #create outer dir
mkdir "$FLASK_APP_NAME"
cd "$FLASK_APP_NAME"

#make inner app dir and files
mkdir app
touch config.py
touch .env
touch run.py
#write to those files: echo "" > filename
echo "$CONFIG_TEXT" > config.py
echo "$ENV_TEXT" > .env
echo "$RUN_TEXT" > run.py

#enter app, create init for packaging
cd app
touch __init__.py
echo "$APP_INIT" > __init__.py

#create api dir, enter api dir
mkdir api
cd api
#create init, models, routes
touch __init__.py
touch models.py
touch routes.py
#write to text files
echo "Writing to files..."
echo "$API_INIT"  > __init__.py 
echo "$MODELS_TEXT" > models.py
echo "$ROUTES_TEXT" > routes.py


echo "Creation successful"
#END
