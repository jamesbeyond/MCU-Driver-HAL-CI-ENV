# ci-build-env docker images

These Docker images are used for MCU Driver HAL build CI workflows.

The docker repository is available in Docker Hub : [mcudriverhal/ci-build-env](https://hub.docker.com/r/mcudriverhal/ci-build-env)

Dockerfiles sources are available inside this folder.


## Tags

#### 🏷️ sanity

For common sanity checks, such as license check, coding-styles check and documents generation. This images contains:

- Essential tools, e.g. `python3` `git` `wget`
- `clang-format` for code style check
- `doxygen` for documents generation
- `awscli` for uploading/downloading artifacts

#### 🏷️ gcc-arm

For compilation jobs that need GCC Arm embedded toolchains. This images contains:

- Essential tools, e.g. `python3` `git` `wget`
- [gcc arm embedded compilers](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
- `awscli` for uploading/downloading artifacts

#### 🏷️ armc6

For compilation jobs that need Arm Compiler 6 toolchains. This images contains:

- Essential tools, e.g. `python3` `git` `wget`
-  [Arm Compiler Version 6](https://developer.arm.com/tools-and-software/embedded/arm-compiler/downloads/version-6)
  *NOTE: The arm compiler will require proper floating license set up to run*
- `awscli` for uploading/downloading artifacts


## Guidelines

- For minor and backward compatible changes to the environment, a PR can be directly raised to update the Dockerfile. In this case, the same tags will be reused after the image has been updated. 
- For breaking changes, please raise a PR to create new tags, including a new `Dockerfile` and update the corresponding CI workflows and the Readme file. Make sure new tag will covered by CI tests and documentation.
- Passive update for these images tags will happens every Sunday. Expect some backward compatible updates to be pulled in every week.

