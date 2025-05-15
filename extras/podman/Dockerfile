FROM debian:bookworm AS base

RUN apt-get update && \ 
    apt-get install --no-install-recommends -y \
      build-essential \
      curl \
      git \
      ca-certificates \
      sudo \
      gpg \
      gpg-agent \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://archive.raspberrypi.com/debian/raspberrypi.gpg.key \
  | gpg --dearmor > /usr/share/keyrings/raspberrypi-archive-keyring.gpg

RUN git clone https://github.com/raspberrypi/rpi-image-gen.git && cd rpi-image-gen 

ARG TARGETARCH
RUN /bin/bash -c '\
  case "${TARGETARCH}" in \
    arm64) \
      apt-get update && \
      rpi-image-gen/install_deps.sh ;; \
    amd64) echo "amd64 host -- binfmt_misc required" && \
      if cat /proc/filesystems | grep -q binfmt_misc; then \
        echo "binfmt_misc: ok" ; \
      else \
        echo "binfmt_misc: not found -- install it on the host" ; \
        exit 1 ; \
      fi && \
      sed -i "s|\"\${binfmt_misc_required}\" == \"1\"|! -z \"\"|g" rpi-image-gen/scripts/dependencies_check && \
      apt-get update && \
      apt-get install --no-install-recommends -y \
		binfmt-support \
        qemu-user-static \
        dirmngr \
        slirp4netns \
        quilt \
        parted \
        debootstrap \
        zerofree \
        libcap2-bin \
        libarchive-tools \
        xxd \
        file \
        kmod \
        bc \
        pigz \
        arch-test && \
      rpi-image-gen/install_deps.sh ;; \
    *) echo "host architecture not supported" ;; \
  esac'


ENV USER build
RUN useradd -u 1000 -ms /bin/bash "$USER" && echo "${USER}:${USER}" | chpasswd && adduser ${USER} sudo # only add to sudo if build scripts require it
USER ${USER}
WORKDIR /build

RUN mkdir -p /build && cp -r /rpi-image-gen /build && chown -R $USER:$USER /build

