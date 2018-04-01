#!/bin/bash
docker stop dot >> /dev/null 2>&1
docker rm dot   >> /dev/null 2>&1
set -x

docker run -it --rm \
  --net host \
  --name dot \
  -v /dev:/dev \
  -v `pwd`:/root \
  -w /root \
  --privileged \
  --entrypoint=/bin/bash \
  michaelsevilla/plfs \
  -c "dot -Tpng -o expdir.png input.dot"

