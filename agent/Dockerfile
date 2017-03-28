#Puppet agent
FROM centos:centos6
LABEL entrypoint="/usr/bin/puppet agent --no-daemonize --verbose"
RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs && rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum install -y yum-utils && yum-config-manager --enable centosplus >& /dev/null
RUN yum install -y puppet
RUN yum clean all
ADD puppet/puppet.conf /etc/puppetlabs/puppet/
ENTRYPOINT [ "/usr/bin/puppet", "agent", "--no-daemonize", "--verbose" ]
#ENTRYPOINT ["/bin/bash"]
