FROM ubuntu:bionic
ENV DEBIAN_FRONTEND=noninteractive
COPY squid-deb-packages/squid-common.deb .
COPY squid-deb-packages/squid.deb .
COPY squid.conf /etc/squid
COPY squid.pem /etc/squid
RUN apt update ; dpkg -i squid*.deb ; apt install -f -y && apt install -y sudo && apt autoclean -y && rm -rf /var/lib/apt/lists/* && rm squid*.deb
RUN mkdir -p /usr/local/squid/var/cache/squid /usr/local/squid/ca /usr/local/squid/var/lib && \
/usr/lib/squid/security_file_certgen -c -s /usr/local/squid/var/lib/ssl_db -M 16MB && \
chown proxy:proxy -R /usr/local/squid/*
COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
