#!/bin/bash
cp -f $(ls [% paths.data.IMAGES %]/genesis_* | sort -rn | head -n 1) [% paths.data.ROOT %]/genesis.img.zst
zstd --rm -qd [% paths.data.ROOT %]/genesis.img.zst  && chmod 400 [% paths.data.ROOT %]/genesis.img
mount [% paths.data.ROOT %]/genesis.img [% paths.psi.ROOT %] 
