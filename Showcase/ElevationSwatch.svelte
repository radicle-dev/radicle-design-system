<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  import Tooltip from "../Tooltip.svelte";

  export let style: string | undefined = undefined;
  export let elevation: string;
</script>

<style>
  .wrapper {
    display: inline-flex;
  }
  .elevation {
    width: 8rem;
    height: 8rem;
    border-radius: 2rem 0 2rem 2rem;
  }
</style>

<div class="wrapper" {style}>
  <Tooltip value={`var(${elevation})`} position="top">
    <div class="elevation" style={`box-shadow: var(${elevation});`} />
  </Tooltip>
</div>
