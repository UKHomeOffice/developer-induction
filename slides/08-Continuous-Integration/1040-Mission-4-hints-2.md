## Mission Hints - .drone.yml

<iframe class="ace stretch" data-mode="shell">drone secret add --image=quay.io/ukhomeofficedigital/kd --conceal ukhomeoffice/acp-hello-world-n MY_SECRET ${echo -n foo | base64}
drone secret add --image=quay.io/ukhomeofficedigital/kd --conceal ukhomeoffice/acp-hello-world-n KUBE_TOKEN your_kube_token
</iframe>