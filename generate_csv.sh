#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <path>"
	exit 1
fi

find "$1" \
	-type f \
	-regextype egrep \
	-regex ".*\.(jpg|jpeg|png|gif|webp|bmp|heif|heic|JPG|JPEG|PNG|GIF|WEBP|BMP|HEIF|HEIC)" \
	-exec realpath {} \; > images.csv
