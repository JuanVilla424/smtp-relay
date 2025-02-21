FROM alpine:3.16

# Pin versions for each package
RUN apk --no-cache add postfix=3.5.8-r0 rsyslog=8.34.0-r1 bash=5.1.8-r0 \
    cyrus-sasl=2.1.27-r10 curl=7.81.0-r0 && \
    chmod +x /entrypoint.sh && \
    echo "*.* /var/log/mail.log" >> /etc/rsyslog.conf && \
    mkdir -p /var/log && touch /var/log/mail.log && \
    newaliases

COPY entrypoint.sh /entrypoint.sh
COPY main.cf /etc/postfix/main.cf

ENTRYPOINT ["/entrypoint.sh"]

CMD ["sh", "-c", "service rsyslog start && postfix start-fg && /entrypoint.sh && rsyslogd && postfix start-fg"]
