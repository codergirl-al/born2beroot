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

## Aptitude vs APT

Both Aptitude and APT are related to package management, and very popular tools.

<details>
<summary> Differences between Aptitude and APT </summary>

**APT** stands for Advanced Packaging Tool. It's open source and it's designed to handle software installation and removal, as a commant-line tool. APT has a flexible approach, meaning that the user can configure how it works, including adding new sources or providing up-gradation options.

**Aptitude** is also an Advanced Packaging Tool, but in comparison to APT it is a front-end tool that gives users access to the user-interface to access functionality. Aptitude is also used to install and remove packages.
Installaton: **sudo apt install aptitude** (the command apt is different from the tool APT)

Aptitude allows emulating apt-get's command line. On top of that, previewing actions is possible using colors and it allows the dselect option.

Key differences:

- APT is a lower-level package manager, while Aptitude is a high level package manager.
- Aptitude offers better functionality compared to apt-get. In fact it does contain the functionalities of pt-get, apt-mark and apt-cache.
- Aptitude comes with an interactive UI in addition to that of the text-only.
- Aptitude can be used for more functionality/features such as automatic or manual package installation and other more refined actions on the packages.

</details>

### Encrypted partitions using LVM

LVM or **Logical Volume Management**, provides a higher-level view of the disk storage on a computer system. This gives the SysAdministrator much more flexibility when it comes to allocating storage to appliactions and users.

Storage volumes that are created under the control of LVM can be resized and moved around.

<details>
<summary>More details:</summary>

- **Physical Volumes** or PV -> Hard disk, hard disk partitions, RAID or LUNs from a SAN.
- **Volume Groups** or VG -> Collection of one or more Physical Volumes.
- **Logical Volumes** or LV -> Virtual partitions inside Volume Groups.
- **Physical Extents** or PE -> Block of data which are necessary to manipulate the actual data.
- **Logical Extents** or LE -> Physical Extents but on a Logical Volume level. The size of blocks are the same for each logical volume in the same volume group.

- #### Encrypted LVM

When formatting a LVM Volume there is the possibility to choose between encrypted or not encrypted. The encrypted options allows to protect valuable data like volume,s olid state disk or hard drive.

For encrypted volumes, backup passwords are needed

<details>
<summary> How to create backup passwords (from the debian.org documentation) </summary>

    1. Add backup passwords

        1. Run the following command in Terminal as Root

        cryptsetup luksChangeKey <device> -S <slot>

            Notes

                * Where -S means you want to edit a specific key-slot. You need to change <slot> for a number ranging from zero to 7. This number will identify which key-slot you want to edit. There are 8 key-slots total available. Ranging from zero to 7. You need to replace <device> with the path to your encrypted LVM volume. For example /dev/sda.

        2. It is suggested to create at least 3 backup passwords. If you want to add an additional backup password simply run the same command, but change the <slot> number to your liking. For example:

    	```shell
        cryptsetup luksChangeKey /dev/sda -S 2
    	```
    2. Backup passwords

        1. Run the following command in Terminal as Root

        ```shell
    	cryptsetup luksHeaderBackup <device> --header-backup-file <file>
    	```

            Notes

                * Where <device> is the location to save your backup to, for example /dev/sda. And <file> is the name of your backup file, for example /media/jenn/2017-05-18_luks_sda_backup. This command backup all height key-slots.
                * It is suggested to store that backup file into a secured, off-line, and different location. So that in the unlikely event that your computer is damage or stolen you would still be able to recover and access your backup data if any.

</details>
</details>

## AppArmor vs SELinux

Both SELinux and AppArmor provide security tols that isolate appliations and limit access to an attacker that has compromised one part of the system.
**AppArmor** grants access first, and then applies restrictions, whilst **SELinux** restricts access by default and only allows access to users with propper certifications.

<details>
<summary>Short comparsion</summary>

### What is SELinux?

SELinux defines access controls for the applications, processes and files on a system. It uses security policies, which are a set of rules that tell SELinux what can or can't be acesssed, to enforce the access allowed by a policy.

<details>
<summary> More info </summary>

- SELinux checks where permissions are cached for subjects and objects using an AVC (**Access Vector Cache**)
- In case of the inability to make a decision, it sends the request to the security server, which checks for the security content of the app or process. That is applied from the SELinux policy database and then permission is granted or denied.
- SELinux works as a labelling system, which means that all of the fils, processes and ports in a system have an SELinux label associated with them. The kernel manages the labels during the boot.
- SELinux uses type enforcement to enforce a policy that is defined on the system. Type enforcement is the part of an SELinux policy that defines whether a process running with a certaintype can access a file labeled with a certain type.
</details>

### What is AppArmor?

AppArmor is an effective and easy-to-use Linux application security system. AppArmor proactively protects the operating system and appliactions from external or internal threats, even zero-day attacks, by enforcing good behavior and preventing both known and unknown application flaws from being exploited - AppArmor documentaton.

<details>
<summary> More info </summary>

It supplements the traditional Unix DAC (Discretonary access control) model by providing mandatory access control (MAC). The mainline Linux Kernel has included it since v.2.6.36.

Advantages of AppArmor

The main advantages of AppArmor are the simplicity and short learning curve. This module is far less complex than SELinux, making it easier to set up and manage.

The tool works directly with profiles (text files) for access control, and file operations are more straightforward. This feature makes AppArmor more user-friendly than SELinux with its security policies.

Thanks to the path-based implementation, AppArmor protects any file on the system and allows for rules to be specified even for files that do not exist yet. The program's learning mode makes AppArmor adaptable to changes and enforces preferred application behavior.

</details>

| Point of comparison      | AppArmor                                                       | SELinux                                                            |
| :----------------------- | :------------------------------------------------------------- | :----------------------------------------------------------------- |
| Access control           | Security profiles based on paths                               | Security policies based on file labels                             |
| Availability             | Available for any distribution, mainly used in SUSE and Ubuntu | Available for any distribution, mainly used on RHEL/Fedora systems |
| Difficulty to learn      | Shorter learning curve, easy set-up                            | Complex and less intuitive                                         |
| Independent verification | Possible                                                       | Not possible                                                       |
| Requires complex config  | No                                                             | Yes                                                                |
| MLS/MCS                  | No                                                             | Yes                                                                |
| Policy rules             | Lacks flexibility                                              | Flexible                                                           |
| Level of control         | Medium                                                         | High                                                               |

</details>

## UFW Firewall

Uncomplicated Firewall (ufw) is a frontend for iptables and is particularly well-suited for host-based firewalls. UFW provides a framework for managing netfilter, as well as a command-line interface for manipulating the firewall.

Simpler explanation: A fireawll which uses the command line for setting up iptables using a small number of easy commands.

[Installation of UFW in Debian](https://wiki.debian.org/Uncomplicated%20Firewall%20%28ufw%29)

<details>
<summary> Default commands </summary>
Defaults  passwd_tries=3
Defaults  badpass_message="Wrong password. please try again."
Defaults  logfile="/var/log/sudo/sudo_config"
Defaults  log_input, log_output
Defaults  iolog_dir="/var/log/sudo"
Defaults  requiretty
Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
</summary>

## SSH
SSH also known as **Secure Shell** or **Secure Socket Shell**, is a network proocol that gives uesrs, particularly system administrators, a secure way to access a computer over an unsecured network.

## The password policy set up in born2beroot

PASS_MAX_DAYS 30 -> MAX amount of days till the password is expired
PASS_MIN_DAYS 2 -> MIN amount of days till the password can be changed

For a strong password policy, we set up the libpam-pwquality library
Based on the subject.pdf sheet:
* minlen=10 -> Minimum characters a password must contain
* ucredit=-1 -> The password has to contain at least a Mayus character. We must write it with a **-** sign, since this is how it knows that is referring to a minimum character; if we put a + sign it will refer to maximum characters.
* dcredit=-1 -> The password has to contain at least a digit.
* maxrepeat=3 -> The password can not have the same character repeated three continuous times
* reject_username -> The password cnnot contain the username inside itself.
* difok=7 -> The password has to contain at least seven different characters from the past password used.
* enforce_for_root => We will implement this pssword policy to root.

## Script

A bash script is a plain text file which contains a series of commands. These commands are a mixutre of commands we would normally type ourselvs o the command line (such as ls or cp for example) and commands we could type on the command line but generally would not.

<details>
<summary> Architecture, Fiscal Cores, Virtual Cores </summary>
#### Architecture:
* uname -a -> Print all information, except if the CPU is unknown or the platform hardware.

#### Physical cores:
What is a physical core? -> A physical core is a CPU contained on a chip, occupying a single socket.
* grep "physical id" /proc/cpuinfo | wc -l -> Looking inside the file "physical id" and with wc -l we count the line of the grep output.

#### Virtual Cores
A virtual core is a CPU with a separation between two areas of the processor. Virtual cores take on some of the processingo of the computer without interfering with the other area. As opposed to physical cores,w hich has something that physically separates the cores, virtual cores do not have physical separation.
* grep processor /proc/cpuinfo | wc -l -> counting processor lines.

#### RAM Memory
**RAM** or Random Access Memory is one of the most important components in determining the performance of a system. It gives applications a place to store and access data on a short-term basis. Data can be accessed quickly because it only stores information that the computer is actively using.
* free --mega | awk '$1 == "Mem:" {print $3}' -> free is used to get a detailed report on the systems memory usage. Provides information about the total amount of the physical and swap memory, as well as the free and used memory. --mega : displays the output in megabytes. The data we get as an output has to be filtered. **awk** command processed data based on text files. What we need to compare or look for is the first occurrence of the word "Mem:". The third word of that row is the used memory
** free --mega | awk '$1 == Mem:' {print $2} -> Prints the available mom
</details>