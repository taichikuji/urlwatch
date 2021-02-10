FROM python:3.9.1-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update -y && apt-get -y install cron wdiff --no-install-recommends \
&& python3 -m pip install --no-cache-dir pyyaml minidb requests keyring keyrings.cryptfile appdirs lxml cssselect beautifulsoup4 jsbeautifier cssbeautifier aioxmpp

WORKDIR /opt/urlwatch

COPY lib ./lib
COPY share ./share
COPY setup.py .
COPY setup.cfg .

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod 733 /entrypoint.sh

RUN python3 setup.py install

VOLUME /root/.urlwatch
WORKDIR /root/.urlwatch
COPY data/ .

CMD ["/bin/sh", "-c", "/entrypoint.sh"]
