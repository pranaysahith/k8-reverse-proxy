#!/bin/bash
if [ -f /first-run ] ; then
	ICAP_URL=$(eval "echo $ICAP_URL")
	echo "ICAP_URL is $ICAP_URL"
	>/etc/squid/conf.d/allowed_backends.conf
	for domain in $( echo $ALLOWED_DOMAINS | tr ',' ' ' ) ; do
	    echo "acl allowed dstdomain $domain" >> /etc/squid/conf.d/allowed_backends.conf
	done
	sed -i "s,ICAP_URL,$ICAP_URL,g" /etc/squid/squid.conf
	sed -i "s,ROOT_DOMAIN,$ROOT_DOMAIN,g" /etc/squid/rewriter
	rm /first-run
    if [ ! -z "$ICAP_EXCLUDE_MIME_TYPE" ] ; then
        for mimetype in $( echo $ICAP_EXCLUDE_MIME_TYPE | tr ',' ' ' ) ; do
            echo "acl noicap rep_mime_type $mimetype" >>  /etc/squid/conf.d/noicap.conf
            sed -i '/noicap/ s/#//g' /etc/squid/squid.conf
        done
    fi
fi
/usr/sbin/squid --foreground -f /etc/squid/squid.conf
