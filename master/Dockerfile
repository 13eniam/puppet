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
#Set permissions on environments otherwise the agents will not be able to request their certificate
RUN chmod -R 755 /etc/puppet/environments

# Install puppet modules
# Install in production
RUN puppet module install puppetlabs-stdlib

# Install in development
RUN puppet module install puppetlabs-stdlib --environment development

EXPOSE 8140
ENTRYPOINT [ "/usr/bin/puppet", "master", "--no-daemonize", "--verbose" ]
