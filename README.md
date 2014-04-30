# demo-deploy-to-noop-part1

This Vagrant environments is for demo and self-study of the 'deploy to noop'
technique of managing systems with Puppet Enterprise.

You'll need to have downloaded and installed the following:
* VirtualBox
* Vagrant

For additional dependencies and setup see the Install section below.

# Install
```bash
$ sudo gem install bundler
$ sudo bundle
```
To check whether or not your system has all of the dependencies necessary to run the Vagrant environments:

```bash
$ rake deps
Checking environment dependencies...
...
Congratulations! Everything looks a-ok.
```

If the above step fails on available Vagrant modules, run:

```bash
$ sudo rake setup
$ rake deps
```

# Usage
The Vagrant environment contains four nodes:
* a Puppet Enterprise master running on Ubuntu 12.04
* a PE agent running Ubuntu 12.04
* a PE agent running Debian GNU/Linux 7.3
* a PE agent running CentOS 6.5

To start up the environment (this will take quite a while the first time!):

```bash
$ vagrant up --no-provision && vagrant provision
```

Connecting to the nodes is via the usual Vagrant commands. As an example, 
to connect to the Puppet Enterprise master:

```bash
$ vagrant ssh master
```

You can access the Puppet Enterprise Console with u/p admin@puppetlabs.com/puppetlabs
@ https://&lt;master eth1 IP address&gt;.


# Support
Please create Issues + Pull Requests against the following repo:

https://github.com/nrvale0/deploy-to-noop-part-1
