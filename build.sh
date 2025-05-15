#!/bin/bash

set -eu

BUILD_ID=${RANDOM}
RIG_SVC="rpi_imagegen"
RPI_CUSTOMIZATIONS_DIR="coderbot"
RPI_CONFIG="coderbot"
RPI_OPTIONS="coderbot"
RPI_IMAGE_NAME="coderbot"

PATH=$PATH:/sbin:/usr/sbin bash -c "rpi-image-gen/build.sh \
		-D ${RPI_CUSTOMIZATIONS_DIR}/ -c ${RPI_CONFIG} \
		-o ${RPI_CUSTOMIZATIONS_DIR}/${RPI_OPTIONS}.options"
mkdir -p deploy/
cp rpi-image-gen/work/${RPI_IMAGE_NAME}/deploy/${RPI_IMAGE_NAME}.img deploy/${RPI_IMAGE_NAME}-$(date +%m-%d-%Y-%H%M).img
