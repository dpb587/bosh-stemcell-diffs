FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y multipath-tools
RUN apt-get install -y wget
WORKDIR /bosh-stemcell-metadata
ADD bin /bosh-stemcell-metadata/bin
ENTRYPOINT /bosh-stemcell-metadata/bin/analyze
