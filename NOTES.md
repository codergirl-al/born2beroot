<details>

## <summary> CentOS vs Debian </summary>

### CentOS and Debian are Linux distributions that spawn from opposite ends of the candle.

CentOS is a free downstream rebuild of the commercial Red Hat Enterprise Linux distribution where, in contract, Debian is the free upstream distribution that is the base for other distributions, including the Ubuntu Linux distribution.


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