FROM        python:3.6

ENV         LANG C.UTF-8

RUN         set -x \
            && apt-get -qq update \
            && apt-get install -yq libpq-dev git \
            && apt-get purge -y --auto-remove \
            && rm -rf /var/lib/apt/lists/*

RUN         mkdir -p /opt/helloworldcloud/app

WORKDIR     /opt/helloworldcloud/app

ADD         requirements.txt /opt/helloworldcloud/app
RUN         pip install --no-cache-dir -r /opt/helloworldcloud/app/requirements.txt

ADD         . /opt/helloworldcloud/app

