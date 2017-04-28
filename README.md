To build the project using docker do:

`docker-compose build`

To run the puppet_agent and puppet_master containers do:

`docker-compose up -d`

Once the containers are up you need to get in the puppet_agent container and request an SSL certificate from the master.

`docker exec -ti puppet_agent /bin/bash`
`puppet agent --test`

That will fail the first time the agent makes a request to the master because the master will not sign it automatically although that can be done for development purposes by setting

`autosign = true`

in the puppet master's configuration file.

To manually sign an agent's certificate, log into the puppet_master container and sign the certificate:

`docker exec -ti puppet_master /bin/bash`
`puppet cert --sign <node-fqdn>`

To apply the hello world resource in site.pp manifest on the agent, log back into the agent and run the --test option:

`puppet agent --test`


You should be able to see Hello World! printed out on the agent.


If you get an error like:

Warning: Unable to fetch my node definition, but the agent run will continue:
Warning: undefined method `include?' for nil:NilClass

when running puppet agent --test, remove the node's yaml file on the master and compile the catalog using puppet agent --test again

`[root@puppet /]# rm /var/lib/puppet/yaml/node/<node>.yaml`
