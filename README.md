# Tailscale in Docker without elevated privileges

See associated blog post: <https://asselin.engineer/tailscale-docker>

**Replace TAILSCALE_AUTH_KEY in `*/tailscale/start.sh` with your own**: <https://login.tailscale.com/admin/settings/keys>

## simple-example

As explained in the blog post, uses a docker-compose service to add the container in the VPN.

## complex-example

Not complex but more complex than the simple-example.
A nginx layer is added. It manages two services in independent containers at locations `/service-one` and `/service-two`.

## K8S

Simple K8S example.
Build and push the image to a registry, and change to image name, in the deployment.yaml file.
Also add you Tailscale key to the env variable in the deployment.

## TODO

- force reuse hostname in tailscale instead of adding suffix. Example: first container is assigned `hostname`. Then, if container is recreated, Tailscale assigns `hostname-1`. Possibly helpful [info](https://tailscale.com/kb/1111/ephemeral-nodes/#can-i-create-an-ephemeral-node-without-an-auth-key).
