FROM alpine:latest

# alpine repository mirror settings
RUN cp /etc/apk/repositories /etc/apk/repositories.bak; \
  sed -i "s/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apk/repositories; \
  echo "https://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories; \
  echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/testing" >> /etc/apk/repositories; \
  apk update && apk upgrade

RUN apk --no-cache add py3-requests;apk --no-cache add git;apk --no-cache add quilt; \
    mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2;

ADD deepin-abigail /deepin-abigail
ADD fastFilesCompare.json /fastFilesCompare.json
ADD postAction.py /postAction.py
ADD entrypoint.sh /entrypoint.sh

RUN chmod 0755 /entrypoint.sh