#!/bin/bash
set -e
SUBFILTER=( ${SUBFILTER_ENV} )
mkdir -p /etc/nginx/conf /etc/nginx/conf.d
echo "SQUID_IP is ${SQUID_IP}"
cat > /etc/nginx/conf/proxy.conf <<EOF

proxy_set_header Host \$host;
proxy_set_header Connection \$connection;
proxy_set_header X-Real-IP \$remote_addr;
proxy_set_header Accept-Encoding "";
proxy_buffering on;
proxy_busy_buffers_size 128k;
proxy_buffer_size 64k;
proxy_buffers 8 128k;
proxy_pass http://${SQUID_IP}:8080;
EOF

for i in "${SUBFILTER[@]}" ;  do
    IFS="," ; set -- $i
    echo "proxy_redirect \"~^(https:\/\/)(:[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?\.?)?$1(?:(\/|:))(.*)\" \$1\$2$2\$3\$4;" >> /etc/nginx/conf/proxy.conf

done

cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen   		80;
    listen              443 ssl http2;
    ssl_certificate     /etc/nginx/full.pem;
    ssl_certificate_key /etc/nginx/full.pem;
    ssl_protocols       TLSv1.2 TLSv1.3;
    client_header_buffer_size 4k;
    large_client_header_buffers 10 8k;
    server_name  _;
    #charset koi8-r;
    access_log  /var/log/nginx/host.access.log  main;
    location / {
      include conf/proxy.conf;
EOF

for i in "${SUBFILTER[@]}" ;  do
    IFS="," ; set -- $i
    echo "sub_filter '$1' '$2' ;"  >> /etc/nginx/conf.d/default.conf
done

cat >> /etc/nginx/conf.d/default.conf <<EOF
      sub_filter_once off;
      sub_filter_types *;
	}
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
EOF
