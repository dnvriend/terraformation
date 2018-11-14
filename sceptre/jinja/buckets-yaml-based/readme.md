OSX
grep -q '^option' buckets.csv && sed -i '.bak' 's/^option.*/option=value/' buckets.csv || echo 'option=value' >> buckets.csv

Linux?
grep -q '^option' buckets.csv && sed -i 's/^option.*/option=value/' buckets.csv || echo 'option=value' >> buckets.csv


image: 508573134510.dkr.ecr.eu-west-1.amazonaws.com/alpine-awscli:master
variables:
  DOCKER_DRIVER: overlay
  AWS_DEFAULT_REGION: "eu-west-1"
  EB_APP_NAME: "stackstate" # $CI_BUILD_TAG # ElasticBeanstalk Application Name
  EB_ENV_NAME: "" # ElasticBeanstalk Application Environment
  CREATE_OR_REMOVE: ""
stages:
  - build

create-stack:
  stage: build
  script:
    - echo Running ./branch-deploy.sh x $CREATE_OR_REMOVE
    - ./branch-deploy.sh $EB_ENV_NAME $CREATE_OR_REMOVE
  environment:
    name: $EB_APP_NAME $EB_ENV_NAME
    url: https://$EB_ENV_NAME.test.stackstate.io
  tags:
  only:
    - triggers
