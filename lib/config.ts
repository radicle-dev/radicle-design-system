// Copyright © 2022 The Radicle Design System Contributors
//
// This file is part of radicle-design-system, distributed under the GPLv3
// with Radicle Linking Exception. For full terms see the included
// LICENSE file.

import * as svelteStore from "svelte/store";

interface Config {
  assetPathPrefix: string;
}

export const config = svelteStore.writable<Config>({
  assetPathPrefix: "", // Set this to "/" for an absolute asset path.
});
