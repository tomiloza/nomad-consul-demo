# nomad-consul-demo

Vagrant box with pre-provisioned [consul](https://www.consul.io/ "Consul Homepage") and [nomad](https://www.nomadproject.io/ "Nomad Homepage").

Necessary docker and java drivers which are used for the Nomad jobs are also pre-installed. 

## Prerequisites:
- VirtualBox >= 5.1.18
- Vagrant >= 1.9.1

### Setup:

```
# cd to project root directory
cd nomad-consul-demo
vagrant up
```

### SSH into a virtual machine
```
vagrant ssh
```

## Project structure

Currently the demo vagrant box contains these directories:

- ```ansible```, this directory contains the ansbile roles which are used for the pre-provisioning of the VM 
- ```apps```, contains the demo applications. Java and Python hello world apps 
- ```jobs```, contains the nomad python,java and docker jobs. The jobs definitions are written in the [hcl](https://github.com/hashicorp/hcl) language.