#!/bin/bash
openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -extensions v3_ca -keyout fullcert.pem -out fullcert.pem -config openssl.cnf
