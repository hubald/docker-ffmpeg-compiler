#!/usr/bin/env bash
#
# Script to fetch the source code for docker-ffmpeg-compiler, build the image, copy the relevant binaries to the current working directory, and delete the image.

[[ -d $(pwd)/out/usr/local/bin ]] || mkdir -p "$(pwd)/out/usr/local/bin"
docker build -t ffmpeg-compiler .
docker run --rm -it -v $(pwd)/out/usr/local/bin:/host ffmpeg-compiler bash -c "cp /root/bin/ffmpeg /root/bin/ffprobe /host && chown $(id -u):$(id -g) /host/ffmpeg && chown $(id -u):$(id -g) /host/ffprobe"
