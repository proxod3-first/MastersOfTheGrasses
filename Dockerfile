FROM python:3.7.9

WORKDIR /app

# copy project files to container
COPY . /app


# # set environment variables for the app (if needed)
# ENV DB_URL "sqlite:///data/db.sqlite3"

# # create database directory
# RUN mkdir -p /data


# install dependencies
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt


# set up database (if needed)
RUN python manage.py migrate

# expose port
EXPOSE 8000

# start the app
CMD ["python", "manage.py", "runserver"]