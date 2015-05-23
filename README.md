# demo-deploy-to-noop-part1

This Vagrant environment is for demo and self-study of the 'deploy to noop'
technique of managing systems with Puppet Enterprise.

You'll need to have downloaded and installed the following:
* VirtualBox
* Vagrant

For additional dependencies and setup see the Install section below.

# Install
```ShellSession
$ gem install bundler
$ bundle install
```
To check whether or not your system has all of the dependencies necessary to run the Vagrant environments:

```ShellSession
$ rake deps
Checking environment dependencies...
...
Congratulations! Everything looks a-ok.
```

If the above step fails on available Vagrant modules, run:

```ShellSession
$ rake setup
$ rake deps
```

# Usage
The Vagrant environment contains four nodes:
* a Puppet Enterprise master running on Ubuntu 12.04 (4GB RAM)
* a PE agent running Ubuntu 12.04 (1GB RAM)
* a PE agent running Debian GNU/Linux 7.3 (1GB RAM)
* a PE agent running CentOS 6.5 (1GB RAM)

To start up the environment: 

```ShellSession
$ vagrant up --no-provision && vagrant provision
```

or alternatively

```ShellSession
$ rake run
```

The above will take a few minutes the first time as the VirtualBox VMs are not
only built out but the required Vagrant baseboxes and PE installer bits will likely
have to be fetched and cached.

Connecting to the nodes is via the usual Vagrant commands. As an example, 
to connect to the Puppet Enterprise master:

```ShellSession
$ vagrant ssh /master/
```

You can access the Puppet Enterprise Console with u/p admin@puppetlabs.com/puppetlabs
@ https://&lt;master eth1 IP address&gt;.


# Support
Please create Issues + Pull Requests against the following repo:

https://github.com/nrvale0/deploy-to-noop-part-1
