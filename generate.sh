#!/bin/sh
set -e

if [ ! -f /data/image.png ]; then
  echo "Base image.png has to be provided!"
  echo 1
fi

if [ ! -d /data/library ]; then
  mkdir /data/library
fi

mkdir /library/

if [ "$(ls -A /data/library/)" ]; then
  echo "$(ls /data/library/ | wc -l) images found.  Using them…"
  cp /data/library/* /library/

else
  echo "No library images provided.  Using $(ls /default-library | wc -l) from default library…"
  cp /default-library/* /library/
fi

echo "Preparing library…"
/usr/local/bin/metapixel-prepare /library  /library-processed

mkdir -p /data/outputs

echo "Creating mosaic…"
/usr/local/bin/metapixel --library /library-processed           --metapixel /data/image.png /data/outputs/1.png

echo "Creating collage…"
/usr/local/bin/metapixel --library /library-processed --collage --metapixel /data/image.png /data/outputs/2.png

echo "All done"
