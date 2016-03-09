FROM ubuntu:14.04
VOLUME /bosh-stemcell-diffs/stemcells
RUN apt-get update
RUN apt-get install -y multipath-tools
RUN apt-get install -y wget
WORKDIR /bosh-stemcell-diffs
ADD bin /bosh-stemcell-diffs/bin
