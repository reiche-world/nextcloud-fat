#!/bin/sh

exec su-exec www-data frankenphp run --config /etc/caddy/Caddyfile
