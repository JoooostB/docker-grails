from os import system

def build_container(version):
    # Used rstrip to get rid of newlines being created
    system("docker build -t joooostb/grails:%s --build-arg GRAILS_VERSION=%s  ." % (version.rstrip(), version.rstrip()))
    system('docker push joooostb/grails:%s' % version.rstrip())
    system('docker image rm joooostb/grails:%s' % version.rstrip())

versions = open('versions.txt').readlines()
# process lines
for version in versions:
    build_container(version)
