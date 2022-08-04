#!/bin/bash

# Copyright © 2022 The Radicle Design System Contributors
#
# This file is part of radicle-design-system, distributed under the GPLv3
# with Radicle Linking Exception. For full terms see the included
# LICENSE file.

set -Eeou pipefail

if [[ "${GITHUB_ACTIONS:-}" = "true" ]]; then
  export CACHE_FOLDER="$HOME/cache"

  function log-group-start () {
    echo "::group::${1:-}"
  }

  function log-group-end () {
    echo "::endgroup::"
  }
else
  echo "Unknown CI platform"
  exit 1
fi

export YARN_CACHE_FOLDER="$CACHE_FOLDER/yarn"
export TIMEFORMAT='elapsed time: %R (user: %U, system: %S)'
