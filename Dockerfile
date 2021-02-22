FROM golang:alpine
RUN set -eux && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && \
    apk add postgresql-dev bash
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' > /etc/timezone
USER appuser
RUN mkdir /home/appuser/config
RUN mkdir /home/appuser/src
WORKDIR /home/appuser/src
COPY --chown=appuser:appgroup  ./project/ ./

