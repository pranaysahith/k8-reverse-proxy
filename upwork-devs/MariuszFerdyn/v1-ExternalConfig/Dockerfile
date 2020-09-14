FROM ubuntu:18.04

ENV SQUID_VERSION=3.5.27 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

COPY squid_3.5.27-1ubuntu1.8_amd64.deb /root/squid_3.5.27-1ubuntu1.8_amd64.deb

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y libssl1.0.0 squid=${SQUID_VERSION}* \
 && rm -rf /var/lib/apt/lists/*

RUN dpkg -i /root/squid_3.5.27-1ubuntu1.8_amd64.deb

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
