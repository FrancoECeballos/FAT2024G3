#!/bin/sh

echo "Waiting for db to be ready..."
sleep 2
echo "Continue..."

python manage.py migrate
echo "Starting django..."
python manage.py runserver 0.0.0.0:8000