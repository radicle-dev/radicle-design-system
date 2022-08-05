<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  export let title: string;
  export let contentStyle: string | undefined = undefined;
</script>

<style>
  .section {
    padding-bottom: 180px;
    padding-left: calc(var(--sidebar-width) + 2rem);
    padding-right: 2rem;
  }

  h1 {
    margin-bottom: 3rem;
  }

  .anchor {
    visibility: hidden;
    position: relative;
    top: -3rem;
  }
</style>

<div class="section">
  <div class="anchor" id={title.toLowerCase()} />
  <h1>{title}</h1>
  <div class="content" style={contentStyle}>
    <slot />
  </div>
</div>
