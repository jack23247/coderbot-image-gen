#rpi-image-gen-example

Build a default system with auto login to the macmind user.

This has been tested on both ARM64 Mac and AMD64 Mac laptops.

AMD is much slower as expected due to emulation.

```bash
git clone https://github.com/jonnymacs/rpi-image-gen-example
```

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

**[Watch and Like the recorded video for this project on YouTube](https://www.youtube.com/watch?v=kxl_swm93XE)** 

[![Watch and Like the recorded video for this project on YouTube](https://img.youtube.com/vi/kxl_swm93XE/maxresdefault.jpg)](https://www.youtube.com/watch?v=kxl_swm93XE)

**[Subscribe to the channel for more similar content](https://www.youtube.com/@macmind-io?sub_confirmation=1)

Please refer to https://github.com/raspberrypi/rpi-image-gen for more information rpi-image-gen

[Follow me on X](https://x.com/jonnymacs), or join my [Discord](https://discord.gg/5KjjbhYY) and don't forget to star [this GitHub repository](https://github.com/jonnymacs/rpi_tutorials)!