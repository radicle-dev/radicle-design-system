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
<path d="M8 11H6V16.8061C5.49961 16.8713 4.99418 16.9204 4.48422 16.9529C3.5461 15.5322 3 13.8299 3 12C3 7.02944 7.02944 3 12 3C15.9027 3 19.2253 5.48409 20.4727 8.9574C19.1652 10.4834 17.6612 11.8361 16 12.9763V7H14V14.204C13.3516 14.5577 12.6843 14.8812 12 15.1724V9H10V15.9154C9.34558 16.1242 8.67842 16.3046 8 16.455V11Z" stroke="var(--color-foreground)" stroke-linejoin="round"/>
<path d="M12 21C16.9706 21 21 16.9706 21 12C21 11.7378 20.9888 11.4782 20.9668 11.2216C17.224 15.3772 12.0195 18.1902 6.16305 18.8508C7.73451 20.191 9.77278 21 12 21Z" stroke="var(--color-foreground)" stroke-linejoin="round"/>
</IconWrapper>
