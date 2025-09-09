# AWS CLI

This repo is used to build a simple Docker image containing the Amazon Web
Services Command Line Interface. It can be used when you don't want to install
the AWS CLI locally.

The repo includes a CircleCI configuration that builds and pushes the Docker
image to docker hub periodically, and when this source repo changes. The name
of the docker hub repo is `ncar/aws-cli`. Images are tagged with the CLI
version number, and the latest image is always tagged `latest`.

To run the image, just use "docker run ncar/aws-cli" instead of "aws"; to
be effective, you should either bind-mount a `~/.aws` directory with
configuration and credentials files to `/root/.aws`, or pass needed environment
variables into the container:

 &nbsp;&nbsp;`docker run --rm --volume=$HOME/.aws:/root/.aws ncar/aws-cli` *aws_subcommand*

 &nbsp;&nbsp;`docker run --rm  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY ncar/aws-cli` *aws_subcommand*
  

Alternatively, you can use the `aws.sh` script included in this repo to run the
docker container for you. It adds `--volume` and `-e` arguments for you, and
also bind-mounts "`.`'" as the container's work directory. It sets the uid and
gid in the container to your effective uid and gid, and tries to run docker
using sudo if you don't have permission to run it directly. 

The `ncar/aws-cli` image itself can install the `aws.sh` for you. Just run the
following:

    docker run --rm ncar/aws-cli --init-rc=<dir> | sh
    
where `<dir>` is a writable local directory in your PATH.
