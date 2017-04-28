#Puppet master
FROM centos:centos6
LABEL entrypoint="/usr/bin/puppet master --no-daemonize --verbose"
RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs && rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum install -y yum-utils && yum-config-manager --enable centosplus >& /dev/null
RUN yum install -y puppetserver
RUN yum clean all

#For open source puppet installation the confdir is in /etc/puppet
ADD puppet/puppet.conf /etc/puppet

#Create environments
RUN mkdir /etc/puppet/environments
COPY environments /etc/puppet/environments

EXPOSE 8140
ENTRYPOINT [ "/usr/bin/puppet", "master", "--no-daemonize", "--verbose" ]
