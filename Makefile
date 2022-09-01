create_k8s:
	kind create cluster --name tailscale
	kubectl get nodes

delete_k8s:
	kind delete cluster --name tailscale

deploy_tailscale:
	kubectl apply -f k8s/deployment.yaml