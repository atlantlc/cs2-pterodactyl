#!/bin/bash
# example startup command; adjust to your args
exec ./srcds_run -game cs2 \
  -tickrate 128 \
  -port ${SERVER_PORT:-27015} \
  +map ${START_MAP:-de_dust2} \
  +sv_password "${RCON_PASSWORD:-}" \
  "$@"
