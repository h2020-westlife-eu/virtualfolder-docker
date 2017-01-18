FROM ubuntu:latest

RUN apt-get update -y -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq davfs2 ca-certificates

COPY mountb2drop-simple.sh /bin/mountb2drop-simple.sh


ENTRYPOINT ["/bin/mountb2drop-simple.sh"]
