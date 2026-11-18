FROM shinsenter/frankenphp:php8.5-alpine as builder

ARG NEXTCLOUD_VERSION=35.0.2

RUN apk add --no-cache curl bzip2 tar \
    && mkdir -p /var/www/html/ \
    && curl -fsSL -o nextcloud.tar.bz2 https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 \
    && tar -xjf nextcloud.tar.bz2 -C /var/www/html/ --strip-components=1 \
    && rm nextcloud.tar.bz2

RUN phpaddmod \
        bz2 \
        gmp \
        ldap \
        memcached \
        imagick \
        sysvmsg \
        sysvsem \
        sysvshm

FROM shinsenter/frankenphp:php8.5-alpine

COPY --from=builder /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=builder /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/
COPY --from=builder /var/www/html /var/www/html
COPY entrypoint.sh /usr/local/bin

ARG ADDITIONAL_PACKAGES="ffmpeg nodejs"

RUN apk add --no-cache \
        gmp \
        imagemagick \
        libldap \
        libmemcached-libs \
        ${ADDITIONAL_PACKAGES} \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && chown -R www-data:www-data /var/www/html \
    && php -m

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]