## Managing deployments to multiple environments​

Kubernetes resource files for each environments is painful​

Enter KD

- We can template these resource files and use them across environments​
- Single command to deploy​
- Waiting for resource creation (e.g. kd waits for containers to be ready on creation of deployment resources)

note:
- Blocking - Doesn't exit till the deploy is done, and gives a meaningful exit code
