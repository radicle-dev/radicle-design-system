#!/bin/bash

# Copyright © 2022 The Radicle Design System Contributors
#
# This file is part of radicle-design-system, distributed under the GPLv3
# with Radicle Linking Exception. For full terms see the included
# LICENSE file.

source ci/env.sh

log-group-start "yarn install"
# Unsetting GITHUB_ACTIONS because yarn tries to add log groups in a buggy way.
env -u GITHUB_ACTIONS yarn install --immutable
env -u GITHUB_ACTIONS yarn dedupe --check
log-group-end

log-group-start "Installing assets"
scripts/install-twemoji-assets.sh build/twemoji
log-group-end

log-group-start "Building static showcase assets…"
webpack build --config-name design-system --mode production
log-group-end
