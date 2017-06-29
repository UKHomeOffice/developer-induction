## Mission Hints - .drone.yml

<iframe class="ace stretch" data-mode="yaml">pipeline:
  my-deploy:
    image: quay.io/ukhomeofficedigital/kd
    environment:
      - KUBE_SERVER=https;//kube-dev.dsp.notprod.homeoffice.gov.uk
      - KUBE_NAMESPACE=dev-induction
      - APP_NAME=sssfsdf
      - APP_VERSION=v1
    commands:
      - kd -f kube-templated/secret.yaml -f kube-templated/deployment.yaml -f kube-templated/service.yaml -f kube-templated/ingress.yaml
    when:
      branch: master
      event: push
</iframe>