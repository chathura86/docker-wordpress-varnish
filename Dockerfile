FROM alpine:latest
LABEL maintainer "chathura86@gmail.com"

ENV VARNISH_BACKEND_ADDRESS 192.168.1.65
ENV VARNISH_MEMORY 100M
ENV VARNISH_BACKEND_PORT 80
ENV VARNISH_PURGE_KEY 9pzg2s2sv0r2acne574mtau0ifmv1wrbicptv2emam1aihwx18w9ghh5xund97d7
ENV VARNISH_LOGIN_COOKIE 4dj82mxhpbometaluzwe6lrqx0w3bpjua2neq2rcpwgm9kk38w4sarw8f7zpq6eg

COPY varnish-wp-vlc /etc/varnish

EXPOSE 80

RUN apk update && \
    apk upgrade && \
    apk add varnish

ADD start.sh /start.sh
RUN chmod 500 /start.sh
CMD ["/start.sh"]
