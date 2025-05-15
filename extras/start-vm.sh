/usr/bin/qemu-system-x86_64 \
	-m 6144 \
	-enable-kvm \
	-smp cores=4 \
	-name rig-builder \
	-hda ata0d0.qcow2 \
	-cdrom debian-12.10.0-amd64-netinst.iso \
	-nic user,hostfwd=tcp::12322-:22
