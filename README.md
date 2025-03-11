Build a default system with auto login to the macmind user.

Build the docker image

```bash
docker compose build
```

Run the image

```bash
docker compose run --rm rpi_imagegen
```

Build the rpi img

```bash
rpi-image-gen/build.sh -o ~/macmind/macmind.options -D ~/macmind -c macmind
```

From another terminal window, copy the generated image to the host

```bash
 docker ps --format '{{.Names}}' | xargs -I '{}' -- docker cp {}:/home/imagegen/rpi-image-gen/work/macminds/deploy/macminds.img ~/
```

Use the Raspberry Pi Imager tool to install the img file on an SD card or USB stick
