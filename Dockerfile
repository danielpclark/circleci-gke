FROM cimg/base:2022.01-20.04

CMD ["bash"]

MAINTAINER Daniel P. Clark <6ftdan@gmail.com>

ENV CLOUD_SDK_VERSION=236.0.0

RUN /bin/sh -c "sudo apt-get update -qqy"

RUN /bin/sh -c "sudo mkdir -p /usr/src/test"

WORKDIR /usr/src/test

RUN /bin/sh -c "curl -fsSL get.docker.com"

VOLUME ["/root/.config"]

CMD ["sleep" "1d"]
