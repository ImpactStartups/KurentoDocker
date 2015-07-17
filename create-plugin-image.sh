#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "$(basename "$0") error: this script has to be run as root" 1>&2
   exit 1
fi

if ! ls -U *.deb 1> /dev/null 2>&1; then
    echo -e "$(basename "$0") error: no .deb file(s) found in the current directory"
    exit 1
fi

if [[ -z "$1" ]]; then
    echo "$(basename "$0") error: no repository name for the image set"
    exit 1
fi

BUILD_BASE_DIR='build'
BUILD_DIR=$BUILD_BASE_DIR
COUNTER=0

while [ -d "$BUILD_DIR" ]; do
    BUILD_DIR=$BUILD_BASE_DIR$COUNTER
    COUNTER=$((COUNTER + 1))
done

dockerfile="$(cat <<EOF
FROM impactstartups/kurento

RUN mkdir -p /kurento/plugins

COPY ["*.deb", "/kurento/plugins/"]

RUN apt-get install dpkg && \
    dpkg -i /kurento/plugins/*.deb
EOF
)"

mkdir $BUILD_DIR
cp *.deb $BUILD_DIR

echo "$dockerfile" > $BUILD_DIR/Dockerfile

docker build -t $1 $BUILD_DIR/.

rm -r $BUILD_DIR
