#!/bin/bash
args="--authkey=${TAILSCALE_AUTH_KEY} --hostname=${TAILSCALE_HOSTNAME}"

if [ -n "$TAILSCALE_LOGIN_SERVER" ]; then
  # Add the flag to the arguments
  args="${args} --login-server=${TAILSCALE_LOGIN_SERVER}"
fi

trap 'kill -TERM $PID' TERM INT
echo "Starting Tailscale daemon"

# -state=mem: will logout and remove ephemeral node from network immediately after ending.
tailscaled --tun=userspace-networking --state=${TAILSCALE_STATE_ARG} &
PID=$!
until tailscale up $args; do
    sleep 0.1
done
tailscale status
wait ${PID}
wait ${PID}