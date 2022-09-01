# Tailscale in Docker without elevated privileges

See associated blog post: <https://asselin.engineer/tailscale-docker>

**Set the TAILSCALE_AUTH_KEY with your own ephemeral auth key**: <https://login.tailscale.com/admin/settings/keys>

## docker-compose

The examples detailed below are in the docker-compose folder.

By default, no state is saved. The nodes are removed from the network when the tailscale container is terminated. This means the ip address is never the same.
The `stateful-example` does save the tailscale node state to a docker volume.

Requirements:
- [docker-compose](https://docs.docker.com/compose/install/)

Usage:
````bash
export TAILSCALE_AUTH_KEY="your-key"
# set which project is used
export PROJECT_DIRECTORY="docker-compose/simple-example"
# Sart with rebuild if necessary:
docker-compose --project-directory=${PROJECT_DIRECTORY} up -d --build
# Show logs and tail (follow):
docker-compose --project-directory=${PROJECT_DIRECTORY} logs --follow
# Stop:
docker-compose --project-directory=${PROJECT_DIRECTORY} down
````

### simple-example

As explained in the blog post, uses a docker-compose service to add the container in the VPN.

### complex-example

Not complex but more complex than the simple-example.
A nginx layer is added. It manages two services in independent containers at urls `/service-one` and `/service-two`.

### stateful-example

Same as simple-example but uses a volume to save state. The goal is to be able to reuse the same tailscale hostname _and ip address_.
Useful in situations where the tailscale magic DNS cannot be used.

## K8S

Same as the simple-example but on kubernetes.

Requirements:

- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installing-with-a-package-manager)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)

Usage:
````bash
# Create cluster
kind create cluster --name tailscale
kubectl get nodes
# Deploy tailscale and demo webpage:
kubectl apply -f k8s/simple-example/deployment.yaml
# Delete cluster:
kind delete cluster --name tailscale
````
