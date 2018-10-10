FROM alpine:3.8
LABEL maintainer="martin.ellinger@twofour.de"

ENV SMTP_HOSTNAME=smtp
ENV SMTP_STARTTLS=no

ENV PHP_POST_SIZE_LIMIT=8M
ENV PHP_UPLOAD_SIZE_LIMIT=8M

ENV ALLOW_ROBOT_INDEXING false

ENV APPLICATION_ENV production

ENV PHP_TIME_LIMIT 240
ENV PHP_MEMORY_LIMIT 256M

EXPOSE 80

WORKDIR /var/www/html

COPY content /

RUN composer-extension-install
RUN common-setup

ENTRYPOINT ["typo3-entrypoint"]
CMD ["httpd"]
