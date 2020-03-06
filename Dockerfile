FROM        python:3.7

ENV         LANG C.UTF-8
ENV         PROJECTPATH=/home/app/helloworldcloud
ENV         USER app

RUN         set -x \
            && apt-get -qq update \
            && apt-get install -yq libpq-dev git \
            && apt-get purge -y --auto-remove \
            && rm -rf /var/lib/apt/lists/*

RUN         useradd -m -d /home/${USER} ${USER} \
            && chown -R ${USER} /home/${USER}

RUN         mkdir -p ${PROJECTPATH}

ADD         . ${PROJECTPATH}

RUN         pip install --upgrade pip \
            && pip install --no-cache-dir -r ${PROJECTPATH}/requirements.txt

WORKDIR     ${PROJECTPATH}
USER        ${user}