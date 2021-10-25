FROM padhihomelab/alpine-base:3.14.1_0.19.0_0.2 as base
ARG TARGETARCH

FROM base AS base-amd64
ENV ARCH=64-bit

FROM base AS base-386
ENV ARCH=32-bit

FROM base AS base-arm64
ENV ARCH=armhf

FROM base AS base-armv7
ENV ARCH=armhf

FROM base-${TARGETARCH}${TARGETVARIANT}


ARG VERSION=2.11.2

ARG PACKAGE=https://web-builds.airdcpp.net/stable/airdcpp_${VERSION}_webui-${VERSION}_${ARCH}_portable.tar.gz
ADD ${PACKAGE} /tmp/airdcpp.tar.gz


COPY entrypoint-scripts \
     /etc/docker-entrypoint.d/99-extra-scripts
COPY airdcpp.sh \
     /usr/local/bin/airdcpp
COPY config \
     /default_config


RUN chmod +x /etc/docker-entrypoint.d/99-extra-scripts/*.sh \
             /usr/local/bin/airdcpp \
 && apk add --no-cache --update \
            tzdata \
 && cd /tmp \
 && tar xvzf airdcpp.tar.gz \
 && mv airdcpp-webclient /airdcpp \
 && rm -rf /tmp/*


EXPOSE 5443
VOLUME [ "/config", "/downloads", "/shared" ]


CMD [ "airdcpp" ]


HEALTHCHECK --start-period=5s --interval=15s --timeout=5s --retries=3 \
        CMD ["wget", "-qSO", "/dev/null", "--header", "Accept: text/html", "http://localhost:5080"]
