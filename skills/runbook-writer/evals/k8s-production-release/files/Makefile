ENV ?= stg
IMAGE_REPO := 123456789012.dkr.ecr.ap-northeast-1.amazonaws.com/api
NAMESPACE := api-$(ENV)
CONTEXT_stg := arn:aws:eks:ap-northeast-1:123456789012:cluster/stg-cluster
CONTEXT_prod := arn:aws:eks:ap-northeast-1:123456789012:cluster/prod-cluster
KUBECTL := kubectl --context $(CONTEXT_$(ENV)) -n $(NAMESPACE)

.PHONY: check-image migrate deploy status rollback

check-image:
	aws ecr describe-images --repository-name api --image-ids imageTag=$(VERSION)

migrate:
	@test -n "$(VERSION)" || (echo "VERSION is required" && exit 1)
	sed "s/__VERSION__/$(VERSION)/" k8s/migrate-job.yaml | $(KUBECTL) apply -f -
	$(KUBECTL) wait --for=condition=complete job/api-migrate-$(VERSION) --timeout=600s

deploy:
	@test -n "$(VERSION)" || (echo "VERSION is required" && exit 1)
	$(KUBECTL) set image deployment/api api=$(IMAGE_REPO):$(VERSION)
	$(KUBECTL) rollout status deployment/api --timeout=300s

status:
	$(KUBECTL) get deployment api -o wide
	$(KUBECTL) get pods -l app=api

rollback:
	$(KUBECTL) rollout undo deployment/api
	$(KUBECTL) rollout status deployment/api --timeout=300s
