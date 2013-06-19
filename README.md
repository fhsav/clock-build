# clock-build

This repository includes both a virtual machine (VM) and build script for launching a new instance of the Clock. _Development in progress._

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

Once this is done (it'll take a while), you'll have the Clock running locally at [http://localhost:3000](http://localhost:3000). You can log in and poke around:

```
$ vagrant ssh
```

Any changes you make to the `clock/` directory on the host system will be reflected in the VM.

## Production

_Put instructions about keys and stuff here..._

Use the `aws` Vagrant provider.

```
$ vagrant up --provider=aws
```
