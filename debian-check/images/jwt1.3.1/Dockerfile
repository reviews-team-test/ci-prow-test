FROM alpine:latest

ADD config/hosts /

# alpine repository mirror settings
RUN cat /hosts >> /etc/hosts;rm -rf /hosts;cp /etc/apk/repositories /etc/apk/repositories.bak; \
  sed -i "s/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apk/repositories; \
  echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/testing" >> /etc/apk/repositories; \
  apk update

RUN apk --no-cache add py3-requests; apk --no-cache add dpkg;apk --no-cache add py3-jwt;apk --no-cache add py3-cryptography

ADD entrypoint /entrypoint
