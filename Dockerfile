FROM debian:bullseye-slim

ENV HOME=/home \
    WORKDIR=/home/workdir
RUN cd /etc/dpkg/dpkg.cfg.d ; \
    sed -e 's:path-exclude /usr/share/groff:#&:' docker >docker.t ; \
    mv docker.t docker ; \
    cd ; \
    apt-get update -y && \
    apt-get install -y \
     curl \
     unzip \
     groff \
     less -y && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" ; \
    unzip awscliv2.zip ; \
    ./aws/install ; \
    mkdir -p $WORKDIR $HOME/.aws
COPY entrypoint.sh /usr/local/bin

WORKDIR $WORKDIR

ENTRYPOINT ["entrypoint.sh"]