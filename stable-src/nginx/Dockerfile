FROM nginx:stable
ENV DEBIAN_FRONTEND=noninteractive
COPY entrypoint.sh /docker-entrypoint.d/00-entrypoint.sh
COPY full.pem /etc/nginx/full.pem
