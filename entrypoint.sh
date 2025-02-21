#!/bin/bash

POSTFIX_MYHOSTNAME=${POSTFIX_MYHOSTNAME:-localhost}
POSTFIX_MYNETWORKS=${POSTFIX_MYNETWORKS:-"127.0.0.0/8"}
POSTFIX_RELAYHOST=${POSTFIX_RELAYHOST:-"[smtp.externalhost.com]:587"}
POSTFIX_SMTP_USERNAME=${POSTFIX_SMTP_USERNAME:-"user"}
POSTFIX_SMTP_PASSWORD=${POSTFIX_SMTP_PASSWORD:-"password"}
POSTFIX_USE_STARTTLS=${POSTFIX_USE_STARTTLS:-"may"}
POSTFIX_EXTERNAL_PORT=${POSTFIX_EXTERNAL_PORT:-587}

postconf -e "myhostname = $POSTFIX_MYHOSTNAME"
postconf -e "mynetworks = $POSTFIX_MYNETWORKS"
postconf -e "relayhost = [$POSTFIX_RELAYHOST]:$POSTFIX_EXTERNAL_PORT"
postconf -e "smtp_sasl_auth_enable = yes"
postconf -e "smtp_sasl_password_maps = static:$POSTFIX_SMTP_USERNAME:$POSTFIX_SMTP_PASSWORD"
postconf -e "smtp_tls_security_level = $POSTFIX_USE_STARTTLS"
postconf -e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"
postconf -e "smtp_sasl_security_options = noanonymous"

echo -e "[$POSTFIX_RELAYHOST]:$POSTFIX_EXTERNAL_PORT $POSTFIX_SMTP_USERNAME:$POSTFIX_SMTP_PASSWORD" > /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd

exec "$@"
