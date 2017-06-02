# Docker best practice
- Use a `ukhomeoffice` base image
- Don't run as `root`
- Keep it small and simple
  - Only one running process
  - Don't install anything you don't need at runtime
  - Minimize layers