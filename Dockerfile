# hadolint ignore=DL3007
FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh
COPY main.cf /etc/postfix/main.cf

# hadolint ignore=DL3018
RUN apk --no-cache add postfix bash cyrus-sasl curl && \
    chmod +x /entrypoint.sh && \
    newaliases

ENTRYPOINT ["/entrypoint.sh"]

CMD ["postfix", "start-fg"]
