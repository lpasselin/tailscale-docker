# Tailscale in Docker without elevated privileges

See associated blog post: <https://asselin.engineer/tailscale-docker>

**Set the TAILSCALE_AUTH_KEY with your own ephemeral auth key**: <https://login.tailscale.com/admin/settings/keys>

The `Makefile` contains all commands to launch the various examples. Refer to it to understand which commands are used.

## docker-compose

By default, no state is saved. The nodes are removed from the network when the tailscale container is terminated. This means the ip address is never the same.
The `stateful-example` does save the tailscale node state to a docker volume.

### simple-example

As explained in the blog post, uses a docker-compose service to add the container in the VPN.

Start with `make start_compose_simple` and stop with `make stop_compose_simple`

### complex-example

Not complex but more complex than the simple-example.
A nginx layer is added. It manages two services in independent containers at locations `/service-one` and `/service-two`.

Start with `make start_compose_complex` and stop with `make stop_compose_complex`

### stateful-example

Same as simple-example but uses a volume to save state. The goal is to be able to reuse the same tailscale hostname _and ip address_.
Useful in situations where the tailscale magic DNS cannot be used.

Start with `make start_compose_stateful` and stop with `make stop_compose_stateful`

## K8S

Requirements:

- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installing-with-a-package-manager)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)

To deploy a local Kind cluster, run `make create_k8s`

To deploy the Tailscale and demo webpage pod, run `make start_k8s_simple` after you change the `TAILSCALE_AUTH_KEY` value to your Tailscale token

To cleanup, run `make delete_k8s`
