#!/usr/bin/env -S bash -Eeo pipefail

rm -rf rapidsai node_modules/{wrtc,@rapidsai}

mkdir -p rapidsai node_modules/@rapidsai

docker pull ghcr.io/rapidsai/node:22.02.00-devel-node16.13.2-cuda11.6.0-ubuntu20.04-packages

docker run --rm -v "$PWD/rapidsai:/out" \
    ghcr.io/rapidsai/node:22.02.00-devel-node16.13.2-cuda11.6.0-ubuntu20.04-packages \
    bash -c "cp \
        /opt/rapids/wrtc-0.4.7-dev.tgz       \
        /opt/rapids/rapidsai-core-*.tgz      \
        /opt/rapids/rapidsai-cuda-*.tgz      \
        /opt/rapids/rapidsai-glfw-*.tgz      \
        /opt/rapids/rapidsai-webgl-*.tgz     \
        /opt/rapids/rapidsai-rmm-*.tgz       \
        /opt/rapids/rapidsai-cudf-*.tgz      \
        /opt/rapids/rapidsai-sql-*.tgz       \
        /opt/rapids/rapidsai-cuml-*.tgz      \
        /opt/rapids/rapidsai-cugraph-*.tgz   \
        /opt/rapids/rapidsai-cuspatial-*.tgz \
        /opt/rapids/rapidsai-io-*.tgz        \
        /opt/rapids/rapidsai-deck.gl-*.tgz   \
        /opt/rapids/rapidsai-jsdom-*.tgz     \
        /out/"

chown $(id -u):$(id -g) rapidsai/*.tgz

cd rapidsai

npm init --yes
npm install --save --production --omit dev --omit peer --omit optional --legacy-peer-deps --force *.tgz
rm package.json *.tgz

cd - 2>&1>/dev/null

ln -s "$PWD/rapidsai/node_modules/wrtc" node_modules/wrtc
ln -s "$PWD/rapidsai/node_modules/@rapidsai/core" node_modules/@rapidsai/core
ln -s "$PWD/rapidsai/node_modules/@rapidsai/cuda" node_modules/@rapidsai/cuda
ln -s "$PWD/rapidsai/node_modules/@rapidsai/glfw" node_modules/@rapidsai/glfw
ln -s "$PWD/rapidsai/node_modules/@rapidsai/webgl" node_modules/@rapidsai/webgl
ln -s "$PWD/rapidsai/node_modules/@rapidsai/rmm" node_modules/@rapidsai/rmm
ln -s "$PWD/rapidsai/node_modules/@rapidsai/cudf" node_modules/@rapidsai/cudf
ln -s "$PWD/rapidsai/node_modules/@rapidsai/sql" node_modules/@rapidsai/sql
ln -s "$PWD/rapidsai/node_modules/@rapidsai/cuml" node_modules/@rapidsai/cuml
ln -s "$PWD/rapidsai/node_modules/@rapidsai/cugraph" node_modules/@rapidsai/cugraph
ln -s "$PWD/rapidsai/node_modules/@rapidsai/cuspatial" node_modules/@rapidsai/cuspatial
ln -s "$PWD/rapidsai/node_modules/@rapidsai/io" node_modules/@rapidsai/io
ln -s "$PWD/rapidsai/node_modules/@rapidsai/deck.gl" node_modules/@rapidsai/deck.gl
ln -s "$PWD/rapidsai/node_modules/@rapidsai/jsdom" node_modules/@rapidsai/jsdom
