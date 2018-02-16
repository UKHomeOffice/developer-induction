## Example Drone yaml file - .drone.yml

<iframe class="ace stretch" data-mode="yaml">pipeline:
  my-build:
    image: docker:17.07.0-ce
    environment:
      - DOCKER_HOST=tcp://127.0.0.1:2375
    commands:
      - docker build -t node-hello-world .
    when:
      branch: master
      event: push

  image_to_quay:
    image: docker:17.07.0-ce
    environment:
      - DOCKER_HOST=tcp://127.0.0.1:2375
    commands:
      - docker login -u=ukhomeofficedigital+drone_demo -p=${DOCKER_PASSWORD} quay.io
      - docker tag node-hello-world quay.io/ukhomeofficedigital/node-hello-world:${DRONE_COMMIT_SHA}
      - docker push quay.io/ukhomeofficedigital/node-hello-world:${DRONE_COMMIT_SHA}
    when:
      branch: master
      event: push
</iframe>
