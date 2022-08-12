<!--
 Copyright © 2021 The Radicle Upstream Contributors

 This file is part of radicle-upstream, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  import { uiFont, uiFontOptions } from "../lib/appearance";
  import SegmentedControl from "../SegmentedControl.svelte";
</script>

<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->


<SegmentedControl
  active={$uiFont}
  options={uiFontOptions}
  on:select={ev => uiFont.set(ev.detail)} />
