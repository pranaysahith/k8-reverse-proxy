#!/bin/bash
openssl req -new -newkey rsa:2048 -sha256 -nodes -extensions v3_ca -out /tmp/fullcert.csr -keyout privkey.key -config openssl.cnf
openssl x509 -req -days 3650 -in /tmp/fullcert.csr -signkey privkey.key \
 -out cert.crt -extfile openssl.cnf -extensions v3_req
openssl x509 -trustout  -req -days 3650 -in /tmp/fullcert.csr -signkey privkey.key -out cert.crt
cat privkey.key >> fullcert.pem
cat cert.crt >> fullcert.pem

