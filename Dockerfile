FROM alpine:latest
LABEL maintainer="Kyle Manna <kyle@kylemanna.com>"

EXPOSE 4282 4285

ARG VERSION=1.7.1
ARG SHA256SUM=cc1cb73ce42d3f8a7c51eabdd26a32a3a966c049725ea91b6e979fbc53b2681b

RUN wget -O /tmp/pkg.zip https://releases.scpri.me/${VERSION}/ScPrime-v${VERSION}-linux-amd64.zip && \
    sha256sum -c <(echo "${SHA256SUM}  /tmp/pkg.zip") && \
    unzip -d /opt /tmp/pkg.zip && \
    rm -f /tmp/pkg.zip && \
    ln -s /opt/ScPrime* /opt/scprime && \
    chmod +x /opt/scprime/sp? && \
    ln -s /opt/scprime/spd /opt/scprime/spc /usr/local/bin && \
    mkdir /metadata

USER nobody:nobody
ENV HOME=/metadata

CMD ["spd", "-d", "/metadata", "-M", "gctwh"]
