FROM alpine:latest
LABEL maintainer="Kyle Manna <kyle@kylemanna.com>"

EXPOSE 4282 4285

ARG VERSION=1.6.3.2
ARG SHA256SUM=fbdfb0d771bebdd1f161ea7565ee89b4374442525c25fd92538f9d6aa00a8d02

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
