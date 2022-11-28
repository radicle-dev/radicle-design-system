<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  import Tooltip from "../Tooltip.svelte";

  export let style: string | undefined = undefined;
  export let color: string;
</script>

<style>
  .wrapper {
    display: inline-flex;
  }
  .color {
    width: 4rem;
    height: 4rem;
    border-radius: 2rem 0 2rem 2rem;
  }
  .border {
    border: 1px solid var(--color-foreground);
  }
</style>

<div class="wrapper" {style}>
  <Tooltip value={`var(${color})`} position="top">
    <div
      class:border={color === "--color-background"}
      class="color"
      style={`background-color: var(${color});`} />
  </Tooltip>
</div>
