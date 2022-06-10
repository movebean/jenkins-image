FROM jenkins/jenkins:lts-jdk11

USER root

RUN apt-get update \
      && apt-get install -y --force-yes sudo \
      && curl -LO https://dl.k8s.io/release/v1.18.0/bin/linux/amd64/kubectl \
      && chmod +x kubectl \
      && mv kubectl /usr/bin/ \
      && apt-get install -y wget \
      && apt-get install -y make \
      && apt-get install -y python3 \
      && rm -rf /var/lib/apt/lists/*

COPY ["./crane", "/usr/bin/"]
COPY ["./go", "/usr/local/go"]
COPY ["./yq", "/usr/local/bin/yq"]
COPY ["./jq", "/usr/local/bin/jq"]
COPY ["./wechatContent.sh", "/usr/local/bin/wechatContent"]
COPY ["./wechatAbort.sh", "/usr/local/bin/wechatAbort"]

ENV GOROOT=/usr/local/go
ENV PATH="${GOROOT}/bin:${PATH}"

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers


USER jenkins
