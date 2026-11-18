ARG SOURCE_VERSION=35.0.2-fpm-alpine
FROM nextcloud:${SOURCE_VERSION}

RUN apk add --no-cache ffmpeg nodejs
