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
  <path
    fill-rule="evenodd"
    clip-rule="evenodd"
    d="M4 12C4 7.58172 7.58172 4 12 4C16.4183 4 20 7.58172 20 12C20 16.4183 16.4183 20 12 20C7.58172 20 4 16.4183 4 12ZM12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2ZM11.06 7.10823C9.7279 6.27567 8 7.23335 8 8.80422V15.1957C8 16.7666 9.7279 17.7243 11.06 16.8917L16.1732 13.696C17.4265 12.9126 17.4265 11.0873 16.1732 10.304L11.06 7.10823ZM10 8.80422L15.1132 12L10 15.1957V8.80422Z"
    fill="#90A0AF" />
</IconWrapper>
