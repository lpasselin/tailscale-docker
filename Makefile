# docker-compose simple
start_compose_simple:
	cd docker-compose/simple-example
	docker-compose build
	docker-compose up

stop_compose_simple:
	cd docker-compose/simple-example
	docker-compose down

# docker-compose complex
start_compose_complex:
	cd docker-compose/complex-example
	docker-compose build
	docker-compose up

stop_compose_complex:
	cd docker-compose/complex-example
	docker-compose down

# docker-compose stateful
start_compose_stateful:
	cd docker-compose/stateful-example
	docker-compose build
	docker-compose up

stop_compose_stateful:
	cd docker-compose/stateful-example
	docker-compose down

# k8s related
create_k8s:
	kind create cluster --name tailscale
	kubectl get nodes

delete_k8s:
	kind delete cluster --name tailscale

start_k8s_simple:
	cd 
	kubectl apply -f k8s/simple-example/deployment.yaml

