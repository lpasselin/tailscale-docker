# Tailscale in Docker

Tailscale in Docker without elevated privileges. See associated blog post: https://asselin.engineer/tailscale-docker

**Replace TAILSCALE_AUTH_KEY in `*/tailscale/start.sh` with your own**: https://login.tailscale.com/admin/settings/keys

## simple-example

As explained in the blog post, uses a docker-compose service to add the container in the VPN.

## complex-example

Not complex but more complex than the simple-example.
A nginx layer is added. It manages two services in independent containers at locations `/service-one` and `/service-two`.

## TODO

- auth key as a secret
- force reuse hostname in tailscale instead of adding suffix. Example: first start is assigned `hostname`. Then, if container is recreated, Tailscale assigns `hostname-1`