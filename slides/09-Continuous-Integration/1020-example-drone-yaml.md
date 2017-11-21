## Example Drone yaml file - .drone.yml

<iframe class="ace stretch" data-mode="yaml">pipeline:
  my-build:
    privileged: true
    image: docker:1.11
    environment:
      - DOCKER_HOST=tcp://127.0.0.1:2375
    commands:
      - docker build -t node-hello-world .
    when:
      branch: master
      event: push

  image_to_quay:
    image: docker:1.11
    environment:
      - DOCKER_HOST=tcp://127.0.0.1:2375
    commands:
      - docker login -u=ukhomeofficedigital+drone_demo -p=${DOCKER_PASSWORD} quay.io
      - docker tag node-hello-world quay.io/ukhomeofficedigital/node-hello-world:${DRONE_COMMIT_SHA}
      - docker push quay.io/ukhomeofficedigital/node-hello-world:${DRONE_COMMIT_SHA}
    when:
      branch: master
      event: push

  pr-builder:
    privileged: true
    image: docker:1.11
    environment:
      - DOCKER_HOST=tcp://127.0.0.1:2375
    commands:
      - docker build -t node-hello-world .
    when:
      event: pull_request

  deploy_to_uat:
    image: quay.io/ukhomeofficedigital/kd:v0.2.2
    environment:
      - KUBE_NAMESPACE=dev-induction
      - APP_VERSION=${DRONE_COMMIT_SHA}
      - KUBE_SERVER=https://kube-dev.dsp.notprod.homeoffice.gov.uk
    commands:
      - kd -f kube-templated/secret.yaml -f kube-templated/deployment.yaml -f kube-templated/service.yaml -f kube-templated/ingress.yaml
    when:
      environment: dev-induction
      event: deployment

services:
  dind:
    image: docker:1.11-dind
    privileged: true
    command:
      - -s
      - overlay
</iframe>