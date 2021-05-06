#!/bin/bash

diskpath="E:\\9_VMImages\\Disks"
vboxmg="VBoxManage.exe"

for node in `$vboxmg list vms | awk -F'\"' '{print $2}' | grep -vE "deploy"`; do
  $vboxmg controlvm $node acpipowerbutton
  echo "doing power off.."
  sleep 1
done

for node in `$vboxmg list vms | awk -F'\"' '{print $2}' | grep -vE "deploy"`; do
  $vboxmg createhd --filename $diskpath\\$node\\$node"_disk1.vdi" --size 100000 --format VDI
  $vboxmg createhd --filename $diskpath\\$node\\$node"_disk2.vdi" --size 100000 --format VDI
  $vboxmg createhd --filename $diskpath\\$node\\$node"_disk3.vdi" --size 100000 --format VDI
  
  $vboxmg storagectl $node --name "SATA Controller" --add sata --controller IntelAhci 
  $vboxmg storageattach $node --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  $diskpath\\$node\\$node"_disk1.vdi"
  $vboxmg storageattach $node --storagectl "SATA Controller" --port 1 --device 0 --type hdd --medium  $diskpath\\$node\\$node"_disk2.vdi"
  $vboxmg storageattach $node --storagectl "SATA Controller" --port 2 --device 0 --type hdd --medium  $diskpath\\$node\\$node"_disk3.vdi" 
done

for node in `$vboxmg list vms | awk -F'\"' '{print $2}' | grep -vE "deploy"`; do
  $vboxmg startvm $node
done

# if you need to delete disk, run below command
# 
# ~$ vboxmanage list hdds
# ~$ vboxmanage closemedium disk [diskname] --delete
