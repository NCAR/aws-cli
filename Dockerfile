FROM alpine:latest
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less && \
    pip install awscli --upgrade && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/* && \
    mkdir $HOME/.aws

ENTRYPOINT ["aws"]