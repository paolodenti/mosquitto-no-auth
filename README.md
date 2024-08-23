# Configurable mosquitto.conf

```bash
persistence ${PERSISTENCE:-false}
allow_anonymous ${ALLOW_ANONYMOUS:-true}
connection_messages ${CONNECTION_MESSAGES:-true}
log_dest ${LOG_DEST:-stdout}
listener ${LISTENER:-1883}
max_queued_messages ${MAX_QUEUED_MESSAGES:-100000}
memory_limit ${MEMORY_LIMIT:-0}
set_tcp_nodelay ${SET_TCP_NODELAY:-true}
```

## Usage example

```bash
docker run -e LISTENER=1884 -e SET_TCP_NODELAY=false paolodenti/mosquitto-no-auth:1.0.1
```
