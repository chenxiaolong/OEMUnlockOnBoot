# OEMUnlockOnBoot

[![latest release badge](https://img.shields.io/github/v/release/chenxiaolong/OEMUnlockOnBoot?sort=semver)](https://github.com/chenxiaolong/OEMUnlockOnBoot/releases/latest)
[![license badge](https://img.shields.io/github/license/chenxiaolong/OEMUnlockOnBoot)](./LICENSE)

OEMUnlockOnBoot is a simple Magisk/KernelSU module that ensures Android's `OEM unlocking` toggle is enabled on every boot. It is meant for use in setups where the bootloader is locked with the user's key (eg. with [avbroot](https://github.com/chenxiaolong/avbroot)) to ensure that the device is always recoverable in the event of a boot failure.

## Usage

1. Download the latest version from the [releases page](https://github.com/chenxiaolong/OEMUnlockOnBoot/releases). To verify the digital signature, see the [verifying digital signatures](#verifying-digital-signatures) section.

2. Install the module from the Magisk/KernelSU app.

3. Reboot. The log file is written to `/data/local/tmp/OEMUnlockOnBoot.log`.

## Verifying digital signatures

First save the public key to a file that lists which keys should be trusted.

```bash
echo 'OEMUnlockOnBoot ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDOe6/tBnO7xZhAWXRj3ApUYgn+XZ0wnQiXM8B7tPgv4' > OEMUnlockOnBoot_trusted_keys
```

Then, verify the signature of the zip file using the list of trusted keys.

```bash
ssh-keygen -Y verify -f OEMUnlockOnBoot_trusted_keys -I OEMUnlockOnBoot -n file -s OEMUnlockOnBoot-<version>-release.zip.sig < OEMUnlockOnBoot-<version>-release.zip
```

If the file is successfully verified, the output will be:

```
Good "file" signature for OEMUnlockOnBoot with ED25519 key SHA256:Ct0HoRyrFLrnF9W+A/BKEiJmwx7yWkgaW/JvghKrboA
```

## Building from source

OEMUnlockOnBoot can be built like most other Android projects using Android Studio or the gradle command line.

To build the module zip:

```bash
./gradlew zipRelease
```

The output file is written to `app/build/distributions/release/`.

## License

OEMUnlockOnBoot is licensed under GPLv3. Please see [`LICENSE`](./LICENSE) for the full license text.
