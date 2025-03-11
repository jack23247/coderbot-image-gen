FROM debian:bookworm AS base

RUN apt-get update && apt-get install --no-install-recommends -y \
      build-essential \
      git \
      ca-certificates \
      sudo \
      gpg-agent \
      dirmngr \
      slirp4netns \
      quilt \
      parted \
      qemu-user-static \
      binfmt-support \
      debootstrap \
      zerofree \
      zip \
      dosfstools \
      libcap2-bin \
      libarchive-tools \
      rsync \
      curl \
      xxd \
      file \
      kmod \
      bc \
      gpg \
      pigz \
      arch-test \
      genimage \
      mtools \
      mmdebstrap \
      bdebstrap \
      podman \
      crudini \
      zstd \
      pv \
      uidmap \
      python-is-python3 \
      dbus-user-session \
      btrfs-progs \
      dctrl-tools \
      uuid-runtime \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://archive.raspberrypi.com/debian/raspberrypi.gpg.key \
  | gpg --dearmor > /usr/share/keyrings/raspberrypi-archive-keyring.gpg

ENV USER imagegen
RUN useradd -u 4000 -ms /bin/bash "$USER" && echo "${USER}:${USER}" | chpasswd && adduser ${USER} sudo
USER ${USER}
WORKDIR /home/${USER}

ARG RPIIG_GIT_SHA 1be18edf906fa180a9b24694f022384dac628192

RUN git clone --no-checkout https://github.com/raspberrypi/rpi-image-gen.git && cd rpi-image-gen && git checkout ${RPIIG_GIT_SHA}


