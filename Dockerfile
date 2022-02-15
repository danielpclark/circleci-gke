FROM cimg/base:2022.01-20.04

CMD ["bash"]

MAINTAINER Daniel P. Clark <6ftdan@gmail.com>

RUN sudo apt-get update -qqy \
    && sudo apt-get install -qqy apt-transport-https ca-certificates gnupg \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
    | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && sudo apt-get update \
    && sudo apt-get install google-cloud-sdk kubectl

RUN sudo mkdir -p /usr/src/test

WORKDIR /usr/src/test

RUN /bin/sh -c "curl -fsSL get.docker.com"

VOLUME ["/root/.config"]

CMD ["sleep" "1d"]
