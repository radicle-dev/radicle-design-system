<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  type EmojiSize = "small" | "regular" | "large" | "huge";

  import twemoji from "twemoji";

  export let emoji: string;
  export let size: EmojiSize = "regular";
  export let style: string | undefined = undefined;

  // Set this to an empty string if you need a relative asset path.
  export let assetPathPrefix: string = "/";
</script>

<style>
  .container {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  :global(.emoji.small) {
    height: 0.75rem;
    width: 0.75rem;
  }

  :global(.emoji.regular) {
    height: 1rem;
    width: 1rem;
  }

  :global(.emoji.large) {
    height: 2rem;
    width: 2rem;
  }

  :global(.emoji.huge) {
    height: 3rem;
    width: 3rem;
  }
</style>

<div {style} class="container">
  {@html twemoji.parse(emoji, {
    className: `emoji ${size}`,
    base: assetPathPrefix,
    folder: "twemoji",
    ext: ".svg",
  })}
</div>
