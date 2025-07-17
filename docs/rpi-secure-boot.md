# RaspberryPi secure boot and disk encryption

This document describes the device specific aspects of the balenaOS secure boot and disk encryption implementation. Technically these are two distinct functionalities:
* Secure boot ensures only trusted operating system images can be booted on the device
* Disk encryption ensures data is stored on the disk encrypted, rather than in plain form

`balenaOS` ties these two together into a single feature in order to achieve operator-less unlocking of the encrypted data on trusted operating systems in a trusted state.

## Supported devices

* RaspberryPi CM4 ioboard (`raspberrypicm4-ioboard-sb` device type)

## Provisioning

The feature is opt-in, in order to enable it, the following section must be appended to your installer's `config.json`:
```json
installer": {
  "secureboot": true
}
```

## Chain of trust

Multiple system components are involved in the validation of a "trusted operating system":
* The process starts in ROM, which we consider trusted by default ("root of trust")
* The ROM verifies the second-stage bootloader in the EEPROM against non-revoked ROM keys
* The second stage bootloader uses a sha256 public key digest in OTP to verify the EEPROM configuration
* The second stage bootloader authenticates the `boot.img` against the `boot.sig` file
* The `boot.img` contains the GPU firmware that is executed and also the balena bootloader and required device tree files
* The balena bootloader mounts and decrypts the root filesystem, loads the kernel with embedded initramfs and uses kexec authentication to launch it
* The Linux kernel then verifies the kernel modules at loading time

The above is commonly referred to as the "chain of trust". For `balenaOS`, the trust ends at kernel level - neither the userspace applications nor user containers are verified. The userspace is read-only and user containers are only installed from authenticated balenaCloud access.

## One time programmable registers (OTP)

The following OTP registers are used in the secure boot and disk encryption mechanism:

* **Digest of public key**: A sha256 digest of the RSA public key used to authenticate EEPROM files.
* **Device specific private key**: A unique per device key that is generated and programmed at installation time and is used to encrypt the LUKS passphrase.

## boot and rpi partition split

On regular `balenaOS` devices there is a single `resin-boot` or `balena-boot` partition mounted under `/mnt/boot`. This holds both the files necessary to boot the device, as well as files necessary for setting up `balenaOS` (e.g. `config.json`, `system-connections`). With secure boot enabled the single boot partition is split in two:
* The `balena-rpi` partition is the only one that stays unencrypted. It contains firmware files like `start4.elf`, the balena bootloader 2nd stage linux kernel and the encrypted LUKS passphrase.
* The `balena-boot` partition is encrypted and contains everything else, as these files may contain secrets such as passwords or API keys which the encryption should protect.

The partitions are mounted under `/mnt/boot` and `/mnt/rpi` respectively.

## Device locking

RaspberryPi devices require post-installation setup to lock the device after the installer image completes programming. This locking process needs to write to OTP and requires a USB connection and the `rpiboot` utility loading a dedicated signed EEPROM image file with the following `config.txt` settings:

* **revoke_devkey=1**: Prevents EEPROM downgrades to versions that don't support secure boot
* **program_pubkey=1**: Programs the digest of the EEPROM's public key to OTP
* **program_jtag_lock=1**: Disables the GPU JTAG interface
* **eeprom_write_protect=1**: Sets the EEPROM to write protect

This dedicated signed EEPROM is deployed as a `secure-boot-lock.tar.gz` balenaOS release asset and can be downloaded from the dashboard.

### Instructions

After programming a device with a secure boot enabled installer image and letting it shut down, the following steps are required to lock the device:

#### Pre-requisites

* Download and build the `rpiboot` utility:
```
git clone https://github.com/raspberrypi/usbboot.git
cd usbboot
make
```
* Download the `secure-boot-lock.tar.gz` asset from the `balenaOS` release into a `secure-boot-lock` directory inside `usbboot` and unpack it:
```
cd secure-boot-lock
tar xvzf secure-boot-lock.tar.gz
```
* The contents will be:
```
./config.txt
./pieeprom.bin
./pieeprom.sig
./bootcode4.bin
```
* Connect the device to your computer using a USB cable
* Configure the device to boot into usb boot mode - on the ioboard there is a jumper labelled `Fit jumper to disable eMMC boot`, other boards may have a different way to do this.
* Power on the device. The kernel log will show:
```
[72269.319714] usb 5-4.1.2: New USB device found, idVendor=0a5c, idProduct=2711, bcdDevice= 0.00
[72269.319718] usb 5-4.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[72269.319721] usb 5-4.1.2: Product: BCM2711 Boot
[72269.319724] usb 5-4.1.2: Manufacturer: Broadcom
[72269.319726] usb 5-4.1.2: SerialNumber: ba7f425f
```

#### Device locking

* Run rpiboot from there:
```
sudo ../rpiboot -d .
```
* Power down, remove serial download jumper / switch, remove USB cable
* The device will boot and appear in dashboard

#### Post-installation validation

From the device hostOS shell:

* Make sure partitions are encrypted:
```
source /usr/libexec/os-helpers-fs
is_part_encrypted /dev/disk/by-state/resin-data && echo "encrypted" || echo "not encrypted"
encrypted
```
* Make sure secure boot is enabled:
```
source /usr/libexec/os-helpers-sb
is_secured && echo "secured" || echo "not secured"
secured
```

Note: Ignore the warnings shown when sourcing the os-helpers files, they're harmless and expected.

## EEPROM updates on locked devices

Once a device is secure boot enabled and is locked down, `rpiboot` driven EEPROM updates will no longer work. Only EEPROM self-updates are possible.

## Re-programming of locked devices

Once a device is secure boot enabled and is locked down, re-programming can be done by USB booting a signed flasher images. The use of `rpiboot` to expose internal storage is not supported.

## Debugging

It is important to understand that due to the nature of the feature, not all debugging procedures are available. Some of the more common ones are:
* A device in production mode will not accept any input or produce any output (screen/keyboard/serial) unless the user application sets it up. This makes it nearly impossible to debug early boot process failures (bootloader/kernel). A device in development mode will still start getty but only after the system gets all the way to userspace.
* It is not possible to tamper with bootloader configuration, which includes changing kernel parameters or modifying `config.txt`.
* Since the encryption keys can only be accessed on the device itself after authenticated booting, it is neither possible to remove the storage media and mount/inspect it on a different device nor boot off a temporary boot media on the same device.
* Some features of the kernel are not available due to it being in lockdown mode. See `man 7 kernel_lockdown` for details.

## FAQ

* **Is it possible to use a custom `config.txt` file?** The `config.txt` file is embedded inside a signed `boot.img` so modifying `config.txt` requires re-creating and re-signing `boot.img`. Using modified `config.txt` files is an extra service available on demand.
* **Is it possible to load out-of-tree kernel modules?** All the kernel modules need to be signed with a trusted key. At this moments we only sign the module at build time so only the out-of-tree modules that we build and ship as a part of `balenaOS` are properly signed. Loading user-built kernel modules require building custom software and is an extra service available on demand.
* **Why is my device not booting after programming?** When a secure boot devices boots, it will check that the device has been locked or abort the boot process. Please make sure the post-installation instructions have been followed.
