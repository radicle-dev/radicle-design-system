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
    d="M12.5 19.5C12.5 20.317 11.817 21 11 21C10.183 21 9.5 20.317 9.5 19.5C9.5 18.683 10.183 18 11 18C11.817 18 12.5 18.683 12.5 19.5Z"
    fill="#90A0AF" />
  <path
    fill-rule="evenodd"
    clip-rule="evenodd"
    d="M11 5C9.80979 5 8.57423 5.2865 7.43876 5.84095C6.94248 6.08328 6.34372 5.87741 6.10139 5.38113C5.85906 4.88485 6.06492 4.28609 6.5612 4.04376C7.96069 3.36039 9.4955 3 11 3C13.2489 3 15.0014 3.5857 16.2088 4.61243C17.4263 5.64774 18 7.05844 18 8.5C18 11.1811 15.6502 14.0135 12 14.0628V15.5312C12 16.0835 11.5523 16.5312 11 16.5312C10.4477 16.5312 9.99999 16.0835 9.99999 15.5312V13C9.99999 12.7109 10.1251 12.436 10.343 12.2461C10.561 12.0562 10.8504 11.9699 11.1368 12.0094C14.2428 12.4383 16 10.2206 16 8.5C16 7.60619 15.655 6.76688 14.9132 6.13603C14.1612 5.49661 12.9138 5 11 5Z"
    fill="#90A0AF" />
</IconWrapper>
