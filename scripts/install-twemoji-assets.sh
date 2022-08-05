#!/bin/bash

# Copyright © 2022 The Radicle Design System Contributors
#
# This file is part of radicle-design-system, distributed under the GPLv3
# with Radicle Linking Exception. For full terms see the included
# LICENSE file.

set -Eeou pipefail

if [ -z "$1" ]
then
  echo "Asset destination path is missing."
  echo "scripts/install-twemoji-assets.sh public/twemoji"
  exit 1
fi

version="$(node -e 'console.log(require("twemoji/package.json").version)')"

echo "Installing Twemoji v${version} SVG assets into $1"

mkdir -p $1
curl -sSL "https://github.com/twitter/twemoji/archive/refs/tags/v${version}.tar.gz" \
  | tar -x -z -C $1 --strip-components=3 "twemoji-${version}/assets/svg"
