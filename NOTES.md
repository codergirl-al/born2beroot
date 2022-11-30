## CentOS vs Debian

### CentOS and Debian are Linux distributions that spawn from opposite ends of the candle.

CentOS is a free downstream rebuild of the commercial Red Hat Enterprise Linux distribution where, in contract, Debian is the free upstream distribution that is the base for other distributions, including the Ubuntu Linux distribution.

<details>

<summary> A short comparison </summary>

## Architecture

Both of them support AArch64/ARM64, armhf/armhfp, i386, ppc64el/ppc64le.

CentOS 7 additionally supports POWER9 while Debian and CentOS 8 do not. CentOS 7 focuses on the x86_64/AMD64 architecture with the other archs released through the AltArch SIG (Alternate Architecture Special Interest Group).

Debian supports MIPSel, MIPS64el and s390x while CentOS does not. Much like CentOS 8, Debian does not favor one arch over another —all supported architectures are supported equally.

## Package management

CentOS uses the **RPM** package format and **YUM/DNF** as thep ackage manager.

Debian uses the **DEB** package format and the **dpkg/APT** as thep ackage manager.

Both offer full-feature package management with network-based repository support, dependency checking and resolution. Similar features are available through different interfaces.

## Filesystems

CentOS does not officially support some of the filesystems that Debian offers. Most notably is ZFS, which by Debian is rovided through a DKMS contribution, whilst it's not supported at all on CentOS.

## Kernel

Debian: 4.19 kernel
CentOS: kernel-lt 5.4 and kernel-ml-5.10 available through 3rd party repos.

Both Debian and Red Hat backport security fixes from newer kernels to their current kernels.

## Upgrading

CentOS: Minor version upgrades but not from one release to another.
Debian: Upgrades from one **stable release** to a newer one, keeping a system up to date after years.

## Support

CentOS: Largely community supported
Debian: Community supported including a bug tracker. At the same time it offers a list of independently working consultants to hire to help resolve issues.

### I ended up choosing Debian because: it's safer to use bugs-wise and it's easier to work with compared to CentOS. Both fulfill the requirements for the project, however though, I believe that working with CentOS requires skills I do not posess yet.

</details>

### Encrypted partitions using LVM

LVM or **Logical Volume Management**, provides a higher-level view of the disk storage on a computer system. This gives the SysAdministrator much more flexibility when it comes to allocating storage to appliactions and users.

Storage volumes that are created under the control of LVM can be reszed and moved around.

**Physical Volumes** or PV -> Hard disk, hard disk partitions, RAID or LUNs from a SAN.
**Volume Groups** or VG -> Collection of one or more Physical Volumes.
**Logical Volumes** or LV -> Virtual partitions inside Volume Groups.
**Physical Extents** or PE -> Block of data which are necessary to manipulate the actual data.
**Logical Extents** or LE -> Physical Extents but on a Logical Volume level. The size of blocks are the same for each logical volume in the same volume group.

* ##### Encrypted LVM

When formatting a LVM Volume there is the possibility to choose between encrypted or not encrypted. The encrypted options allows to protect valuable data like volume,s olid state disk or hard drive.

For encrypted volumes, backup passwords are needed

<details>
<summary> How to create backup passwords (from the debian.org documentation) </summary>

Steps

    Add backup passwords

        Run the following command in Terminal as Root

        cryptsetup luksChangeKey <device> -S <slot>

            Notes

                Where -S means you want to edit a specific key-slot. You need to change <slot> for a number ranging from zero to 7. This number will identify which key-slot you want to edit. There are 8 key-slots total available. Ranging from zero to 7. You need to replace <device> with the path to your encrypted LVM volume. For example /dev/sda. 

        It is suggested to create at least 3 backup passwords. If you want to add an additional backup password simply run the same command, but change the <slot> number to your liking. For example:

        cryptsetup luksChangeKey /dev/sda -S 2

    Backup passwords

        Run the following command in Terminal as Root

        cryptsetup luksHeaderBackup <device> --header-backup-file <file>

            Notes

                Where <device> is the location to save your backup to, for example /dev/sda. And <file> is the name of your backup file, for example /media/jenn/2017-05-18_luks_sda_backup. This command backup all height key-slots.
                It is suggested to store that backup file into a secured, off-line, and different location. So that in the unlikely event that your computer is damage or stolen you would still be able to recover and access your backup data if any.
</details>