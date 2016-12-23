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

  deploy-to-prod:
    image: busybox
    commands:
      - /bin/echo hello prod
    when:
      environment: dev-induction
      event: deployment

  deploy:
    image: busybox
    commands:
      - /bin/echo hello ${ENV_NAME}
    when:
      environment: uat
      event: deployment

  first-step:
    image: busybox
    commands:
      - echo hello > test.txt
    when:
      branch: master
      event: push

  second-step:
    image: busybox
    commands:
      - cat test.txt
    when:
      branch: master
      event: push

  third-step:
    image: quay.io/ukhomeofficedigital/kd:v0.2.2
    commands:
      - env
    when:
      branch: master
      event: push

  deploy_to_uat:
    image: quay.io/ukhomeofficedigital/kd:v0.2.2
    environment:
      - KUBE_NAMESPACE=dev-induction
    commands:
      - cd kube-node-hello-world
      - ./deploy.sh
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