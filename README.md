# MCU Driver HAL CI Environment

This repository contains Dockerfiles that are used for building CI environments docker images.

All docker images are available in Docker Hub: https://hub.docker.com/u/mcudriverhal 


## Docker repositories and images

#### 📁ci-build-env
The `ci-build-env` folder is mapped to the `ci-build-env` docker repository.

This docker repository is in Docker Hub : [mcudriverhal/ci-build-env](https://hub.docker.com/r/mcudriverhal/ci-build-env), and it contains images that are used for MCU Driver HAL build CI pipelines. 
[More details](ci-build-env/)

#### 📁ci-test-env

The `ci-test-env` folder is mapped to the `ci-test-env` docker repository.

This docker repository is in Docker Hub : [mcudriverhal/ci-test-env](https://hub.docker.com/r/mcudriverhal/ci-test-env), and contains images that are used for MCU Driver HAL LAVA test CI pipelines. 
[More details](ci-test-env/)

## CI Workflows for updating environment images

This repository is monitored by a series of CI testing jobs in GitHub Actions.

Each above docker repository folder has a set of CI jobs for:
- Passive update: `<docker_name>_Passive_Update.yml`
- PR checks: `<docker_name>_CheckPR.yml`
- Post merge update: `<docker_name>_PostMerge_Update.yml`


#### Updating existing environments

Create a Pull-Request to update the Dockerfile. GitHub Actions will automatically run on you Pull-Request and update the image when your Pull-Request is merged.

#### Adding a new environment image to an existing docker repository

Create a Pull-Request which contains a new Dockerfile in a new folder. The name of folder will be used as tag to the Dockerfile. Also related GitHub Actions workflows will need to be updated to cover your new tag.

#### Creating a new docker repository

Create a Pull-Request which contains a top level-folder as the name of the repository and a second-level folder as names of the tags. Dockerfiles need to be inside the tags folder. New GitHub Actions workflows for `Passive update`, `PR checks` and `Post merge update` to check the Dockerfiles need to be created by the owners.


## License and contributions

The software is provided under the [Apache-2.0 license](LICENSE-apache-2.0.txt). All contributions to software and documents are licensed by contributors under the same license model as the software/document itself (ie. inbound == outbound licensing). MCU-Driver-HAL may reuse software already licensed under another license, provided the license is permissive in nature and compatible with Apache v2.0.

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for more information.
