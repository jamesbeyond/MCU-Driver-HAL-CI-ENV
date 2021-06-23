# ci-test-env docker images

These Docker images are used for MCU Driver HAL test CI workflow.

The docker repository is available in Docker Hub : [mcudriverhal/ci-test-env](https://hub.docker.com/r/mcudriverhal/ci-test-env)

Dockerfiles sources are available inside this folder.



## Tags

#### 🏷️ lavacli

This images is for submitting LAVA jobs only, so keep it simple. This image contains:

- Essential tools, e.g. `python3` `wget`
- `lavacli` for submit LAVA jobs

#### 🏷️ greentea

This images is for running Greentea tests inside LAVA dispatcher, so its size needs to be kept small. This image contains:

- Essential tools, e.g. `python3` `git` `wget`
- Greentea tools including `mbed-greentea` `mbed-host-tests`
- `awscli` for uploading/downloading artifacts



## Guidelines

- For minor and backward compatible changes to the environment, a PR can be directly raised to update the Dockerfile. In this case, the same tags will be reused after the image has been updated.
- For breaking changes, please raise a PR to create new tags, including a new Dockerfile and update the corresponding CI workflows and the Readme file. Make sure new tag will covered by CI tests and documentation.
- Passive update for these images tags will happens every Sunday. Expect some backward compatible updates to be pulled in every week.

