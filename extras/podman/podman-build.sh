#!/bin/bash

set -eu

BUILD_ID=${RANDOM}
RIG_SVC="rpi_imagegen"
RPI_CUSTOMIZATIONS_DIR="coderbot"
RPI_CONFIG="coderbot"
RPI_OPTIONS="coderbot"
RPI_IMAGE_NAME="coderbot"

getcid() {
	podman ps -a --filter "name=${RIG_SVC}-${BUILD_ID}" --format "{{.ID}}" | head -n 1
}

cleanup() {
	CID=$(getcid) \
	&& podman compose kill ${RIG_SVC}
}

trap cleanup EXIT
podman compose build ${RIG_SVC}
podman compose --in-pod=0 up -d ${RIG_SVC} \
	&& podman compose exec ${RIG_SVC} \
		bash -c "rpi-image-gen/build.sh \
				-D ${RPI_CUSTOMIZATIONS_DIR}/ -c ${RPI_CONFIG} \
				-o ${RPI_CUSTOMIZATIONS_DIR}/${RPI_OPTIONS}.options" \
	&& podman cp $(getcid):/build/rpi-image-gen/work/${RPI_IMAGE_NAME}/deploy/${RPI_IMAGE_NAME}.img ./deploy/${RPI_IMAGE_NAME}-$(date +%m-%d-%Y-%H%M).img
