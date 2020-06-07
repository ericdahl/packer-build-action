#!/bin/sh
set -e

# Set the working directory for the template
cd "${INPUT_WORKINGDIR:-.}"

# find template file
if [[ ! -f "$INPUT_TEMPLATEFILE" ]] && [[ $INPUT_TEMPLATEFILE != *.json ]]; then
    echo "${INPUT_TEMPLATEFILE} does not exit in the working directory (${INPUT_WORKINGDIR})"
    exit 1
fi

set +e
# Run packer build
BUILD_OUTPUT=$(sh -c "packer build ${INPUT_TEMPLATEFILE}" 2>&1)
BUILD_SUCCESS=$?
echo "$BUILD_OUTPUT"
set -e

exit $BUILD_SUCCESS
