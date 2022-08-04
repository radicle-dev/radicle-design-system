<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  import Emoji from "./Emoji.svelte";
</script>

<style>
  .animation {
    animation: rotate, rotate-back;
    animation-iteration-count: infinite;
    animation-timing-function: cubic-bezier(0.45, 1.45, 0.8, 1);
    animation-duration: 1400ms;
  }
  @keyframes rotate {
    0%,
    15%,
    85%,
    100% {
      transform: rotate(0deg);
    }
    35%,
    65% {
      transform: rotate(180deg);
    }
  }
</style>

<div class="animation">
  <Emoji emoji="⏳" size="large" />
</div>
