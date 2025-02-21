FROM alpine:3.16

COPY entrypoint.sh /entrypoint.sh

# hadolint ignore=DL3018
RUN apk --no-cache add postfix rsyslog bash cyrus-sasl curl && \
    chmod +x /entrypoint.sh && \
    echo "*.* /var/log/mail.log" >> /etc/rsyslog.conf && \
    mkdir -p /var/log && touch /var/log/mail.log && \
    newaliases

COPY main.cf /etc/postfix/main.cf

ENTRYPOINT ["/entrypoint.sh"]

CMD ["sh", "-c", "service rsyslog start && postfix start-fg && /entrypoint.sh && rsyslogd && postfix start-fg"]
