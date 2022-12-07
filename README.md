# born2beroot

System administration related exercise

You will create your first machine in VirtualBox (or UTM if you can't use VirtualBox) under specific instructions. Then, at the end of this project, you will be able to set up your own operating system while implementing strict rules.

### General guidelines

- The use of VirtualBox (or UTM) is mandatory
- You only have to turn in a signature.txt file at the root of your repository. You must paste in it the signature of your machine's virtual disk.

## Operating system: Debian or CentOS

* Create at least 2 encrypted partitions using LVM.

NAME				MAJ:MIN	RM	SIZE	RO	TYPE	MOUNTPOINT	
SDA					  	8:0	 0	  8G	 0	disk
|-sda1					8:2	 0	487M	 0	part	/boot
|-sda2					8:2	 0	  1K	 0	part
|-sda5					5:5	 0	7.5G	 0	part
   |-sda5_crypt