# 01-single-native-runner
This template creates:

- public vpc
- ec2 instance running the Gitlab AMI
- ec2 user data configuration that does the following:
  - install docker
  - register the docker-based runner
  - run the docker-based runner

## How to use
Type:

- make create
- make delete
- make info

## CI
The `.gitlab-ci.yml` file is where you configure what CI does with your project. It lives in the root of your repository. On any push to your repository, GitLab will look for the `.gitlab-ci.yml` file and start jobs on Runners according to the contents of the file, for that commit.

Because `.gitlab-ci.yml` is in the repository and is version controlled, old versions still build successfully, forks can easily make use of CI, branches can have different pipelines and jobs, and you have a single source of truth for CI.

The steps needed to have a working CI can be summed up to:

- Add `.gitlab-ci.yml` to the root directory of your repository
- Configure a Runner

From there on, on every push to your Git repository, the Runner will automagically start the pipeline and the pipeline will appear under the project's Pipelines page.

## Resources
- [GitLab Documentation](https://docs.gitlab.com/ee/README.html)
- [GitLab Continuous Integration (GitLab CI/CD)](https://docs.gitlab.com/ee/ci/README.html)
- [Configuration of your jobs with .gitlab-ci.yml](https://docs.gitlab.com/ee/ci/yaml/)
- [GitLab Runner](https://docs.gitlab.com/runner/)
- [Run GitLab Runner in a container](https://docs.gitlab.com/runner/install/docker.html)
- [AWS S3 + GitLab CI](https://rpadovani.com/aws-s3-gitlab)

Have fun!