<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  export let hovering: boolean = false;
  export let style: string | undefined = undefined;

  const enter = () => (hovering = true);
  const leave = () => (hovering = false);
</script>

<div {style} on:mouseenter={enter} on:mouseleave={leave}>
  <slot {hovering} />
</div>
