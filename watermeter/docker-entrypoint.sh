#!/bin/sh
set -e

CONFIG_DIR=/usr/src/watermeter/src/config
DEFAULTS_DIR=/usr/src/watermeter/src/config.defaults
DATA_DIR=/data

# Point the app's config path at the Supervisor's persistent /data volume.
if [ ! -L "$CONFIG_DIR" ]; then
    rm -rf "$CONFIG_DIR"
    ln -s "$DATA_DIR" "$CONFIG_DIR"
fi

# Seed it with upstream defaults on first run only (never overwrite existing config).
if [ ! -f "$DATA_DIR/config.php" ]; then
    cp -a "$DEFAULTS_DIR"/. "$DATA_DIR"/
fi

exec "$@"
