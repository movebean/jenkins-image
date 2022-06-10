FROM uttne/jenkins:lts-base

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
