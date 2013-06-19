# clock-build

This repository includes both a virtual machine (VM) and build script for launching a new instance of the clock. _Development in progress._

## Instructions

You'll need [Vagrant](http://vagrantup.com) and the [Vagrant AWS Provider](https://github.com/mitchellh/vagrant-aws). Install Vagrant for your system, then run the following to get the AWS Provider.

```
$ vagrant plugin install vagrant-aws
```

## Development

Just run the default Vagrant provider.

```
$ vagrant up
```

## Production

_Put instructions about keys and stuff here..._

Use the `aws` Vagrant provider.

```
$ vagrant up --provider=aws
```
