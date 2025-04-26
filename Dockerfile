# Base on SteamCMD image
FROM cm2network/steamcmd:root

# env vars
ENV SRCDS_APPID=???   # put CS2 dedicated server app ID
ENV SRCDS_HOME=/home/steam/cs2
ENV STEAM_USER=anonymous
ENV STEAMCMD_ARGS="+@sSteamCmdForcePlatformType windows +login $STEAM_USER +force_install_dir $SRCDS_HOME +app_update $SRCDS_APPID validate +quit"

# install CS2
RUN mkdir -p $SRCDS_HOME \
 && steamcmd $STEAMCMD_ARGS

# expose ports
EXPOSE 27015/udp 27015/tcp

# working dir & entrypoint
WORKDIR $SRCDS_HOME
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
