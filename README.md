# vagrant script that can deploy various OS type.
This is repository that have vagrant scripts.
These vagrant script will deploy VM with VirtualBox.
Also you can deploy application using Ansible.

# how to run Ansible 
1. Will run with Vagrant in \*-deploy directory
   The Vagrant file refer to playbook in ../provisioning.
   ```
   # example
   cd centos7-deploy
   vagrant up
   ```
2. (optional)If you want to ansible playbook alone, should check 'vagrants/provisioning/hosts.ini
   host.ini have to same host information with IP address on Vagrantfile.
   ```
   cd provisioning
   # assumed that inventory.lst already be modified.
   ```

# Tested Environment
* vagrant 2.2.16
* virtualbox 6.1.22

# References

> If you run these vagrant script on WSL, please check below link
> * https://jacobbaek.com/795
