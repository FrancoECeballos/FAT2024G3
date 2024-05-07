FROM python:3.10

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

#RUN python manage.py migrate

RUN python ProntaEntrega/manage.py collectstatic --noinput

#CMD ["python","manage.py","runserver","0.0.0.0:8000"]

ENTRYPOINT ["sh", "entrypoint.sh"]