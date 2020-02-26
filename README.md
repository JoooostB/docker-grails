# Docker Grails
This containerimage is a series of Docker-tags for every Grails version currently out there starting from 2.0.0.

## Usage
The main goal of Docker Grails is the usage in CI-pipelines like GitLab to build artifacts from within a specific Grails version environment. 
Example `.gitlab-ci.yml` would look like this:
```yml
prod:
  stage: Build war
  tags:
    - docker
  only:
    - master
  image: joooostb/grails:${GRAILS_VERSION}
  script:
    - cd PROJECT_DIR
    - /root/.sdkman/candidates/grails/${GRAILS_VERSION}/bin/grails prod war --non-interactive --stacktrace
```

Of course the image can also be used locally to build, the command would be as follows:
`docker run -it -v /my/project/dir:/usr/src/app myproject:latest /root/.sdkman/candidates/grails/${GRAILS_VERSION}/bin/grails prod war --non-interactive --stacktrace`
