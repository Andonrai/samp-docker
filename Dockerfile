FROM debian:buster

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        wget \
        libc6:i386 \
        libstdc++6:i386

ARG SAMP_URL="http://files.sa-mp.com/samp037svr_R2-1.tar.gz"
ARG SAMP_VERSION="0.3.7-r2"

ENV SAMP_URL ${SAMP_URL}
ENV SAMP_VERSION ${SAMP_VERSION}

RUN cd /opt && \
    wget ${SAMP_URL} && \
    tar xvzf samp*.tar.gz && \
    rm samp*.tar.gz && \
    mv samp* samp

WORKDIR /opt/samp

COPY run.sh /start.sh

RUN chmod +x /start.sh && \
    ln -sf /dev/stdout server_log.txt

ENV SAMP_LAN_MODE 0
ENV SAMP_RCON_PASSWORD changeme
ENV SAMP_MAX_PLAYERS 50
ENV SAMP_PORT 7777
ENV SAMP_HOSTNAME "SA-MP 0.3 Server"
ENV SAMP_FILTER_SCRIPTS "base gl_actions gl_property gl_realtime"
ENV SAMP_ANNOUNCE 0
ENV SAMP_QUERY 1
ENV SAMP_WEB_URL "www.sa-mp.com"
ENV SAMP_MAX_NPC 0
ENV SAMP_ONFOOT_RATE 40
ENV SAMP_INCAR_RATE 40
ENV SAMP_WEAPON_RATE 40
ENV SAMP_STREAM_DISTANCE "300.0"
ENV SAMP_STREAM_RATE 1000

EXPOSE 7777/tcp
EXPOSE 7777/udp

CMD ["/start.sh"]
