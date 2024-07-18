FROM padhihomelab/alpine-base:3.20.1_0.19.0_0.2 AS base
ARG TARGETARCH

FROM base AS base-amd64
ENV ARCH_ALIAS=64-bit

FROM base AS base-386
ENV ARCH_ALIAS=32-bit

FROM base AS base-arm64
ENV ARCH_ALIAS=armhf

FROM base AS base-armv7
ENV ARCH_ALIAS=armhf

FROM base-${TARGETARCH}${TARGETVARIANT}


ARG AIRDCPP_VERSION=2.12.2
ARG WEBUI_VERSION=2.12.1

ARG AIRDCPP_PKG_URL=https://web-builds.airdcpp.net/stable/airdcpp_${AIRDCPP_VERSION}_webui-${WEBUI_VERSION}_${ARCH_ALIAS}_portable.tar.gz
ADD ${AIRDCPP_PKG_URL} /tmp/airdcpp.tar.gz


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


EXPOSE 5600
VOLUME [ "/config", "/downloads", "/shared" ]


CMD [ "airdcpp" ]


HEALTHCHECK --start-period=5s --interval=15s --timeout=5s --retries=3 \
        CMD ["wget", "-qSO", "/dev/null", "--header", "Accept: text/html", "http://localhost:5600"]
