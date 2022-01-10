# CF CLI Action
Deploy to Cloud Foundry and manage your apps and services using the CF CLI easily with this GitHub Action.

## Example Workflow
```
name: Deploy to Cloud Foundry

on:
  push:
    branches:
    - main

jobs:
  build:
    runs-on: ubuntu-18.04
    # Build your app here

  deploy:
    runs-on: ubuntu-18.04
    # needs: build
    
    steps:
    - uses: Daze-Locked/Daze-CFdry-CLI@main
      with:
        cf_api: https://api.my-cloud-foundry.com
        cf_username: ${{ secrets.CF_USERNAME }}
        cf_password: ${{ secrets.CF_PASSWORD }}
        cf_org: sapsubaccount
        cf_space: dev
        docker_passwrd: ${{ secrets.CF_DOCKER_PASSWRD }}
        command: push cloudfoundryapp --docker-image repo/image:tag --docker-username repo -t 60
```
