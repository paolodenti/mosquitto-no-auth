#!/bin/ash
set -e

# customization
mkdir -p /mosquitto/config
cat <<EOF >/mosquitto/config/mosquitto.conf
persistence ${PERSISTENCE:-false}
allow_anonymous ${ALLOW_ANONYMOUS:-true}
connection_messages ${CONNECTION_MESSAGES:-true}
log_dest ${LOG_DEST:-stdout}
listener ${LISTENER:-1883}
max_queued_messages ${MAX_QUEUED_MESSAGES:-100000}
memory_limit ${MEMORY_LIMIT:-0}
set_tcp_nodelay ${SET_TCP_NODELAY:-true}
EOF

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
	[ -d "/mosquitto" ] && chown -R mosquitto:mosquitto /mosquitto || true
fi

exec "$@"
