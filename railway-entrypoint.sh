#!/bin/sh
set -e
# Railway volumes mount root-owned and empty — create the layout ABS expects.
# Library folders must exist before they can be added as libraries in the UI.
mkdir -p /data/config /data/metadata /data/library/audiobooks /data/library/podcasts
cd /app
exec node index.js
