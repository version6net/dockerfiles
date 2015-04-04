#!/bin/bash

cd /minecraft-server
chown minecraft.minecraft .

if [ ! -e /data/eula.txt ]; then
  if [ "$EULA" != "" ]; then
    echo "# Generated via Docker on $(date)" > eula.txt
    echo "eula=$EULA" >> eula.txt
  else
    echo ""
    echo "Please accept the Minecraft EULA at"
    echo "  https://account.mojang.com/documents/minecraft_eula"
    echo "by adding the following immediately after 'docker run':"
    echo "  -e EULA=TRUE"
    echo ""
    exit 1
  fi
fi

SERVER="minecraft_server.$VERSION.jar"

if [ ! -e $SERVER ]; then
  echo "Downloading $SERVER ..."
  wget -q https://s3.amazonaws.com/Minecraft.Download/versions/$VERSION/$SERVER
  chmod 755 $SERVER
  ln -sf $SERVER minecraft_server.jar
fi

if [ ! -e server.properties ]; then
  cp /tmp/server.properties .

  if [ -n "$MOTD" ]; then
    sed -i "/motd\s*=/ c motd=$MOTD" server.properties
  fi

  if [ -n "$LEVEL" ]; then
    sed -i "/level-name\s*=/ c level-name=$LEVEL" server.properties
  fi

  if [ -n "$SEED" ]; then
    sed -i "/level-seed\s*=/ c level-seed=$SEED" server.properties
  fi

  if [ -n "$PVP" ]; then
    sed -i "/pvp\s*=/ c pvp=$PVP" server.properties
  fi

  if [ -n "$MODE" ]; then
    case ${MODE,,?} in
      0|1|2|3)
        ;;
      s*)
        MODE=0
        ;;
      c*)
        MODE=1
        ;;
      *)
        echo "ERROR: Invalid game mode: $MODE"
        exit 1
        ;;
    esac

    sed -i "/gamemode\s*=/ c gamemode=$MODE" server.properties
  fi
  chown minecraft.minecraft server.properties
fi


if [ -n "$OPS" -a ! -e ops.txt.converted ]; then
  echo $OPS | awk -v RS=, '{print}' >> ops.txt
  chown minecraft.minecraft ops.txt
fi

if [ -n "$ICON" -a ! -e server-icon.png ]; then
  echo "Using server icon from $ICON..."
  # make sure the file is already PNG 64x64
  wget -q -O server-icon.png $ICON
  chmod 644 server-icon.png
fi
