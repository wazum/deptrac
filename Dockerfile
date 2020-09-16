FROM php:7.4-fpm-alpine

LABEL maintainer="Wolfgang Klinger <wolfgang@wazum.com>"

ARG DEPTRAC_VERSION=0.8.2

RUN apk add --no-cache gnupg \
    && cd /tmp \
    && curl -LS https://github.com/sensiolabs-de/deptrac/releases/download/$DEPTRAC_VERSION/deptrac.phar -o deptrac.phar \
    && curl -LS https://github.com/sensiolabs-de/deptrac/releases/download/$DEPTRAC_VERSION/deptrac.phar.asc -o deptrac.phar.asc \
    && gpg --keyserver pool.sks-keyservers.net --recv-keys 088B72897980555C6E4EF6693C52E7DED5E2D9EE \
    && gpg --verify deptrac.phar.asc deptrac.phar \
    && mv deptrac.phar /usr/local/bin/deptrac \
    && chmod +x /usr/local/bin/deptrac \
    && rm -rf deptrac.phar.asc /tmp/* \
    && apk del -f gnupg

WORKDIR /app

ENTRYPOINT ["deptrac"]
