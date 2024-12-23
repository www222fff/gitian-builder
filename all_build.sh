#!/bin/bash

# 设置变量
VERSION="0.21.3-beta"
BASE_DIR="/home/dannyaw/blockchain"
GITIAN_DIR="$BASE_DIR/gitian-building/gitian-builder"

cd ${GITIAN_DIR}

bin/gbuild --num-make 10 --memory 12000 --commit BTCGPU=v${VERSION} /home/dannyaw/blockchain/BTCGPU/contrib/gitian-descriptors/gitian-linux.yml
mv build/out/bitcoin-*.tar.gz build/out/src/bitcoin-*.tar.gz ../release

bin/gbuild --num-make 10 --memory 12000 --commit BTCGPU=v${VERSION} /home/dannyaw/blockchain/BTCGPU/contrib/gitian-descriptors/gitian-win.yml
mv build/out/bitcoin-*-win-unsigned.tar.gz inputs/bitcoin-win-unsigned.tar.gz
mv build/out/bitcoin-*.zip build/out/bitcoin-*.exe ../release

bin/gbuild --num-make 10 --memory 12000 --commit BTCGPU=v${VERSION} /home/dannyaw/blockchain/BTCGPU/contrib/gitian-descriptors/gitian-osx.yml
mv build/out/bitcoin-*-osx-unsigned.tar.gz inputs/bitcoin-osx-unsigned.tar.gz
mv build/out/bitcoin-*.tar.gz build/out/bitcoin-*.dmg ../release


echo "Build and signing process completed."
