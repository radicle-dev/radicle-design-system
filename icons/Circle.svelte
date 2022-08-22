<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  import IconWrapper from "./IconWrapper.svelte";

  export let style: string | undefined = undefined;
</script>

<IconWrapper on:click {style}>
  <circle
    fill="none"
    stroke="var(--color-foreground-level-5)"
    stroke-width="2px"
    cx="12"
    cy="12"
    r="10" />
</IconWrapper>
