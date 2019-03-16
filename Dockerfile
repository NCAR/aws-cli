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
    mkdir -p $WORKDIR $HOME/.aws

#    chmod -R 777 $HOME

WORKDIR $WORKDIR

ENTRYPOINT ["aws"]