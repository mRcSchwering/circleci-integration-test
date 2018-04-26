FROM alpine:3.7

RUN apk --no-cache add postgresql-client && rm -rf /var/cache/apk/*
