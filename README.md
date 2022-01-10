# Flask-Template
Bash script for generating a "starter code" template for basic Flask APIs. It follows general best practices for structuring an application in modules, with high cohesion and loose coupling. It is set up with SQLAlchemy as an ORM for both SQLite and Postgres, with Bcrypt handling any encryption. However, you can of course swap/add libraries to suit your needs.

## App Structure
```bash
~/flask_server
    |-- run.py
    |-- config.py
    |__ requirements.txt
    |__ .env
    |__ /app
         |-- __init__.py
         |-- models.py
         |-- /api
             |-- __init__.py
             |-- routes.py
    |__ /tests
         |-- __init__.py
         |-- test_app.py

```

## Setup
At the top of the script you'll find all the variables for setting the text that is echoed into each file. If you want to use the default code, you'll only have to change two variables, WORKDIR and FLASK_APP_NAME. WORKDIR is the directory in which you want the flask template to be created, and FLASK_APP_NAME is the name of the template.
```bash
WORKDIR="../Python Projects/Flask/"
FLASK_APP_NAME="flask_app"
````
Get yourself a nice Linux or Unix-based system, and make sure you give this file proper execute permissions. Then, you're all set!
```bash
 chmod +x flask_api_template.sh
 ```
 Note: the .sh extension is optional, since Linux doesn't care about file extensions

### Adding new files
The template_files directory is set up to mimic the file structure of the app it will create. You can add/remove/alter these text files as needed. If adding/removing files, you must add/remove the appropriate variable under the VARIABLES section, so it is read and stored by the script.
```bash
YOUR_FILE_TEXT=$(<template_files/<PATH>/YOUR_FILE.txt)
```

## Running the Script
In whichever directory you store the script, you can simply run:
```bash
./flask_api_template.sh
```

## Setting up the .env file
If you are to use this as a base for your project, you must set the following parameters (at minimum):
```bash
SECRET_KEY=<your_chosen_key>
FLASK_APP=run.py
SQLALCHEMY_DATABASE_URI=sqlite:///<your_db_name>.db
```

### More Information
For more details on getting started with Flask and structuring your application, please refer to this awesome article by DigitalOcean: https://www.digitalocean.com/community/tutorials/how-to-structure-large-flask-applications
