#!/bin/ash
echo "Starting TS daemon"
tailscaled --tun=userspace-networking &
PID=$!
until tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=${TAILSCALE_HOSTNAME}; do
    sleep 0.1
done
tailscale status
wait ${PID}