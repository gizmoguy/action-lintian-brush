FROM debian:sid

RUN apt-get update \
 && apt-get -y install git lintian-brush

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
