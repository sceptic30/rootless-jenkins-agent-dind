FROM jenkins/agent:latest-alpine-jdk11

ARG USER=jenkins
ARG USER_ID=1001
ARG DOCKER_SOCK_GID=117

USER root
COPY jenkins-agent.sh /usr/local/bin/jenkins-agent.sh
WORKDIR /home/jenkins
RUN set -eux \
    && apk --no-cache update \
    && apk --no-cache upgrade --available \
    && apk --no-cache add shadow \
    && apk --no-cache add docker curl --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community \
    && deluser --remove-home $USER \
    && addgroup -g $DOCKER_SOCK_GID $USER \
    && adduser -g "" -u $USER_ID -G $USER -h /home/jenkins -D $USER \
    && usermod -aG docker $USER \
    && ln -s /usr/local/bin/jenkins-agent.sh /usr/local/bin/jenkins-slave \
    && apk del shadow \
    && chown $USER_ID:$DOCKER_SOCK_GID /usr/local/bin/jenkins-agent.sh \
    && chmod +x /usr/local/bin/jenkins-agent.sh

USER $USER
ENTRYPOINT ["/usr/local/bin/jenkins-agent.sh"]