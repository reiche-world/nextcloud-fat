ARG SOURCE_VERSION=32-fpm-alpine
FROM nextcloud:${SOURCE_VERSION}

RUN apk add --no-cache ffmpeg nodejs
