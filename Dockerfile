FROM alpine:latest
LABEL maintainer="Kyle Manna <kyle@kylemanna.com>"

EXPOSE 4282 4285

RUN unzip -d /opt <(wget -O - https://releases.scpri.me/1.6.2/ScPrime-v1.6.2-linux-amd64.zip) && \
    ln -s /opt/ScPrime* /opt/scprime && \
    chmod +x /opt/scprime/sp? && \
    ln -s /opt/scprime/spd /opt/scprime/spc /usr/local/bin && \
    mkdir /metadata

USER nobody:nobody
ENV HOME=/metadata

CMD ["spd", "-d", "/metadata", "-M", "gctwh"]
