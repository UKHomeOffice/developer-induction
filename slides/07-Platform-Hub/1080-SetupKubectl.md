## Setup the kubectl 

<iframe class="ace stretch" data-mode="yaml">

kubectl config set-cluster acp-dev --certificate-authority=\<acp-dev-cert\> --server=\<acp-dev-cluster-ip\>

kubectl config set-context acp-dev --cluster='acp-dev' --user='acp-dev' --namespace='developer-induction'

kubectl config set-credentials acp-dev --token=\<user-token\>

</iframe>
