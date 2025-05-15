# coderbot-image-gen

Builds a Raspbian image customized for the CoderBot

## Debian Hosts

On Debian(-derived) hosts, you can use `rpi-image-gen` to provision the image.

1. Clone `rpi-image-gen` in this repo's root folder
2. Run `preinstall.sh`
3. Change whatever you want in `coderbot/`
4. Run `build.sh`

The resulting image will be copied to the `deploy/` folder.

## TODOs

- Proper Wi-Fi setup
- Test SSH server
- Change/customize hostname
	- from the CLI (e.g. `bash build.sh emb-cb01` -> `deploy/[...]_emb-cb01.img`)

## Podman

I tried using Podman-in-Podman to no avail; you can find the scripts in `extras/podman` if you want to play around with them. This also means that building on non-Debian systems (e.g. Fedora) is not supported.
