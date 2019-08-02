FROM        python:3.7

ENV         LANG C.UTF-8

RUN         set -x \
            && apt-get -qq update \
            && apt-get install -yq libpq-dev git \
            && apt-get purge -y --auto-remove \
            && rm -rf /var/lib/apt/lists/*
RUN         mkdir -p /opt/helloworldcloud/app
ADD         . /opt/helloworldcloud/app
RUN         pip install --no-cache-dir -r /opt/helloworldcloud/app/requirements.txt
WORKDIR     /opt/helloworldcloud/app
ENTRYPOINT  ["python", "manage.py"]
CMD         ["runserver", "0.0.0.0:8000"]  