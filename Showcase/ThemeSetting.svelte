<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  import { theme, themeOptions } from "../lib/appearance";
  import SegmentedControl from "../SegmentedControl.svelte";
</script>

<SegmentedControl
  active={$theme}
  options={themeOptions}
  on:select={ev => theme.set(ev.detail)} />
