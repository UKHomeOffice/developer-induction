## Using Kubectl

Here a list of useful commands to be run when querying your namespace:

`kubectl --context=<your-context> -n developer-induction get po`

`kubectl --context=<your-context> -n developer-induction get events`

`kubectl --context=<your-context> -n developer-induction describe deploy hello-world`

`kubectl --context=<your-context> -n developer-induction exec -it hello-world-*-* /bin/sh`

`kubectl --context=<your-context> -n developer-induction scale deploy/hello-world --replicas=3`

`kubectl --context=<your-context> -n developer-induction explain`
