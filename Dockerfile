FROM alpine:latest

ENV HOME=/home \
    WORKDIR=/home/workdir
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less && \
    pip install awscli --upgrade && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/* && \
    mkdir -p $WORKDIR $HOME/.awsy

COPY aws.sh entrypoint.sh /usr/local/bin/

WORKDIR $WORKDIR

ENTRYPOINT ["entrypoint.sh"]