#!/bin/bash
set -e

# Enumerate the vendors in this file
VENDORS=('polyverse')

# polyverse commitshas
POLYVERSE_READHOOK_VER="v1.3.0-alpha"

function main() {
	VENDOR_ROOT="${PWD}/vendor"

	# Delete the whole vendor folder and make a clean one
	rm -rf ${VENDOR_ROOT} && mkdir -p "${VENDOR_ROOT}"

	# Upvendor each of the listed vendors
	for VENDOR in ${VENDORS[@]}; do
		upvendor $VENDOR
	done

	return 0
}

function upvendor() {
	VENDOR_FOLDER="${VENDOR_ROOT}/$1"
	mkdir -p "${VENDOR_FOLDER}"

	echo "INFO: Upvendoring: $1"
	cd ${VENDOR_FOLDER}
	$1
}

function polyverse() {
	if [[ -n "$PV_UPVENDOR_LOCAL" ]]; then # (Convenience for development)
		cp -v ../../../readhook/dll/basehook.so .
		cp -v ../../../readhook/dll/fullhook.so .
	else
		wget -nv https://github.com/polyverse/readhook/releases/download/${POLYVERSE_READHOOK_VER}/basehook.so
		wget -nv https://github.com/polyverse/readhook/releases/download/${POLYVERSE_READHOOK_VER}/fullhook.so
	fi
}

main "$@"
exit $?
