<!--
 Copyright © 2022 The Radicle Design System Contributors

 This file is part of radicle-design-system, distributed under the GPLv3
 with Radicle Linking Exception. For full terms see the included
 LICENSE file.
-->
<script lang="ts">
  import { SvelteComponent } from "svelte";

  import ArrowUpIcon from "./icons/ArrowUp.svelte";
  import CheckIcon from "./icons/Check.svelte";
  import CrossIcon from "./icons/Cross.svelte";
  import ForkIcon from "./icons/Fork.svelte";
  import LockIcon from "./icons/Lock.svelte";
  import MinusIcon from "./icons/Minus.svelte";
  import PlusIcon from "./icons/Plus.svelte";

  import Theme from "./Theme.svelte";

  import ThemeSetting from "./Showcase/ThemeSetting.svelte";
  import PrimaryColorSetting from "./Showcase/PrimaryColorSetting.svelte";
  import CodeFontSetting from "./Showcase/CodeFontSetting.svelte";
  import UiFontSetting from "./Showcase/UiFontSetting.svelte";

  import Button from "./Button.svelte";
  import Checkbox from "./Checkbox.svelte";
  import Dropdown from "./Dropdown.svelte";
  import Emoji from "./Emoji.svelte";
  import IdentifierLink from "./IdentifierLink.svelte";
  import LoadingAnimation from "./LoadingAnimation.svelte";
  import SegmentedControl from "./SegmentedControl.svelte";
  import SupportButton from "./SupportButton.svelte";
  import TextInput from "./TextInput.svelte";
  import TextArea from "./TextArea.svelte";
  import ThreeDotsMenu from "./ThreeDotsMenu.svelte";
  import Tooltip from "./Tooltip.svelte";
  import TrackToggle from "./TrackToggle.svelte";

  import ColorSwatch from "./Showcase/ColorSwatch.svelte";
  import ElevationSwatch from "./Showcase/ElevationSwatch.svelte";
  import Section from "./Showcase/Section.svelte";
  import TypographySwatch from "./Showcase/TypographySwatch.svelte";

  export let onClose: (() => void) | undefined = undefined;

  function extractCssVariables(variableName: string) {
    return Array.from(document.styleSheets)
      .filter(
        sheet =>
          sheet.href === null || sheet.href.startsWith(window.location.origin)
      )
      .reduce<string[]>(
        (acc, sheet) =>
          // eslint-disable-next-line @typescript-eslint/ban-ts-comment
          // @ts-ignore
          (acc = [
            ...acc,
            // eslint-disable-next-line @typescript-eslint/ban-ts-comment
            // @ts-ignore
            ...Array.from(sheet.cssRules).reduce(
              (def, rule) =>
                // eslint-disable-next-line @typescript-eslint/ban-ts-comment
                // @ts-ignore
                (def =
                  // eslint-disable-next-line @typescript-eslint/ban-ts-comment
                  // @ts-ignore
                  rule.selectorText === ":root"
                    ? [
                        ...def,
                        // eslint-disable-next-line @typescript-eslint/ban-ts-comment
                        // @ts-ignore
                        ...Array.from(rule.style).filter(name =>
                          // eslint-disable-next-line @typescript-eslint/ban-ts-comment
                          // @ts-ignore
                          name.startsWith(variableName)
                        ),
                      ]
                    : def),
              []
            ),
          ]),
        []
      );
  }

  const colors = extractCssVariables("--color");
  const colorGroups = [
    ...new Set(
      colors.map(color => {
        const match = color.match(/--color-(\w*)-?/);
        if (match) {
          return match[1];
        } else {
          return "";
        }
      })
    ),
  ];

  const elevations = extractCssVariables("--elevation");

  const icons = [
    "Anchor",
    "AnchorSmall",
    "ArrowBoxUpRight",
    "ArrowCollapse",
    "ArrowDown",
    "ArrowExpand",
    "ArrowLeft",
    "ArrowRight",
    "ArrowUp",
    "At",
    "Blockie",
    "Box",
    "Branch",
    "Chat",
    "Check",
    "CheckedBox",
    "CheckCircle",
    "CheckSmall",
    "ChevronDown",
    "ChevronLeft",
    "ChevronLeftRight",
    "ChevronRight",
    "ChevronUp",
    "ChevronUpDown",
    "Circle",
    "Commit",
    "Device",
    "Copy",
    "CopySmall",
    "Cross",
    "CrossCircle",
    "CrossSmall",
    "CurrencyDAI",
    "Ellipsis",
    "EllipsisSmall",
    "Envelope",
    "Ethereum",
    "Exclamation",
    "ExclamationCircle",
    "EyeClosed",
    "EyeOpen",
    "File",
    "Folder",
    "Fork",
    "Github",
    "Globe",
    "GnosisSafe",
    "Heart",
    "HeartFace",
    "House",
    "Info",
    "InfoCircle",
    "Key",
    "Label",
    "Ledger",
    "Link",
    "Lock",
    "MagnifyingGlass",
    "Merge",
    "Minus",
    "Network",
    "Orgs",
    "Pause",
    "Pen",
    "Plus",
    "Question",
    "PlusSmall",
    "Proposals",
    "Registered",
    "RegisteredSmall",
    "Review",
    "Patch",
    "Road",
    "Server",
    "Settings",
    "ThumbsDown",
    "ThumbsUp",
    "TokenStreams",
    "Transactions",
    "Trash",
    "Twitter",
    "User",
    "Wallet",
    "Play",
    "Sharrow",
    "Download",
    "Trophy",
    "Coin",
    "Splits",
    "Explore",
    "Radicle",
    "Gitlab",
    "Git",
    "Hamburger",
  ];

  async function importIconComponents(
    iconNames: string[]
  ): Promise<{ component: SvelteComponent; name: string }[]> {
    return await Promise.all(
      iconNames.map(async iconName => {
        return {
          component: (await import(`./icons/${iconName}.svelte`)).default,
          name: iconName,
        };
      })
    );
  }

  function onKeydown(event: KeyboardEvent) {
    if (
      event.target === document.body &&
      event.code === "Escape" &&
      onClose !== undefined
    ) {
      onClose();
    }
  }

  let settingsHeaderPinned: boolean = false;
</script>

<style>
  .close-button {
    cursor: pointer;
    position: absolute;
    right: 32px;
    top: 22px;
  }

  .fullscreen {
    align-items: center;
    display: flex;
    height: 100vh;
    justify-content: center;
    overflow: auto;
    width: 100vw;
  }

  .content {
    overflow: visible;
    height: 100%;
    width: 100%;
  }

  table {
    margin-bottom: 32px;
  }

  td {
    vertical-align: middle;
    padding: 5px;
  }

  .layout {
    padding: 32px;
  }

  .swatch {
    display: flex;
    margin-bottom: 32px;
    align-items: flex-end;
  }

  .sidebar {
    width: var(--sidebar-width);
    height: 100%;
    background-color: var(--color-foreground-level-2);
    position: fixed;
    z-index: 10;
    display: flex;
    flex-direction: column;
    align-items: start;
    gap: 1.5rem;
    padding-top: 3rem;
    padding-left: 2rem;
  }

  .sidebar a {
    display: inline-flex;
    gap: 1rem;
    justify-content: center;
    align-items: center;
  }

  .settings {
    display: flex;
    gap: 2rem;
    align-items: center;
    background-color: var(--color-foreground-level-1);
    flex: 1;
    height: 5rem;
    padding-left: calc(var(--sidebar-width) + 2rem);
    width: 100%;
    z-index: 5;
  }
</style>

<Theme />

<svelte:window on:keydown={onKeydown} />

{#if onClose !== undefined}
  <div class="close-button">
    <Button style="padding:0.5rem;" on:click={onClose} variant="transparent">
      <CrossIcon />
    </Button>
  </div>
{/if}

<div class="fullscreen">
  <div class="content">
    <div class="sidebar">
      <a href="#colors" class="button-transition">
        <Emoji emoji="🎨" size="large" />
        <h3>Colors</h3></a>
      <a href="#elevations" class="button-transition">
        <Emoji emoji="🏔️" size="large" />
        <h3>Elevations</h3></a>
      <a href="#typography" class="button-transition">
        <Emoji emoji="🔤" size="large" />
        <h3>Typography</h3></a>
      <a href="#icons" class="button-transition">
        <Emoji emoji="🖼️" size="large" />
        <h3>Icons</h3></a>
      <a href="#components" class="button-transition">
        <Emoji emoji="🫐" size="large" />
        <h3>Components</h3></a>
    </div>

    <div
      class="settings"
      style:position={settingsHeaderPinned ? "fixed" : "relative"}>
      <UiFontSetting />
      <CodeFontSetting />
      <ThemeSetting />
      <PrimaryColorSetting />

      <span style="margin-left: auto; margin-right: 3.5rem;">
        <LockIcon
          on:click={() => (settingsHeaderPinned = !settingsHeaderPinned)}
          style={settingsHeaderPinned
            ? "fill: var(--color-foreground)"
            : "fill: var(--color-foreground-level-4)"} />
      </span>
    </div>

    <div class="layout">
      <slot name="top" />

      <Section title="Colors">
        {#each colorGroups as colorGroup}
          <div>
            {#each colors.filter(color => {
              return color.match(colorGroup);
            }) as color}
              <ColorSwatch {color} style="margin: 0 1rem 1rem 0;" />
            {/each}
          </div>
        {/each}
      </Section>

      <Section title="Elevations" contentStyle="display: flex; gap: 3rem;">
        {#each elevations as elevation}
          <ElevationSwatch {elevation} />
        {/each}
      </Section>

      <Section title="Typography">
        <TypographySwatch title="<h1>">
          <h1>Radicle Design System</h1>
        </TypographySwatch>

        <TypographySwatch title="<h2>">
          <h2>Radicle Design System</h2>
        </TypographySwatch>

        <TypographySwatch title="<h3>">
          <h3>Radicle Design System</h3>
        </TypographySwatch>

        <TypographySwatch title={`<h3 class="typo-mono-bold">`}>
          <h3 class="typo-mono-bold">Radicle Design System</h3>
        </TypographySwatch>

        <TypographySwatch title="<h4>">
          <h4>Radicle Design System</h4>
        </TypographySwatch>

        <TypographySwatch title={`<p> or <p class="typo-text">`}>
          <p>Radicle Design System</p>
        </TypographySwatch>

        <TypographySwatch title={`<p class="typo-text-bold">`}>
          <p class="typo-text-bold">Radicle Design System</p>
        </TypographySwatch>

        <TypographySwatch title={`<p class="typo-text-mono">`}>
          <p class="typo-text-mono">Radicle Design System</p>
        </TypographySwatch>

        <TypographySwatch title={`<p class="typo-mono-bold">`}>
          <p class="typo-mono-bold">Radicle Design System</p>
        </TypographySwatch>

        <TypographySwatch title={`<p class="typo-text-small">`}>
          <p class="typo-text-small">Radicle Design System</p>
        </TypographySwatch>

        <TypographySwatch title={`<p class="typo-text-small-bold">`}>
          <p class="typo-text-small-bold">Radicle Design System</p>
        </TypographySwatch>

        <TypographySwatch title={`<p class="typo-text-small-bold">`}>
          <p class="typo-text-small-bold">0123456789</p>
        </TypographySwatch>

        <TypographySwatch title={`<a class="typo-link" href="#relative-link">`}>
          <a class="typo-link" href="#relative-link">Relative link</a>
        </TypographySwatch>

        <TypographySwatch
          title={`<a class="typo-link" href="https://radicle.xyz">`}>
          <a class="typo-link" href="https://radicle.xyz">External link</a>
        </TypographySwatch>

        <TypographySwatch title={`<p class="typo-all-caps">`}>
          <p class="typo-all-caps">Radicle Design System</p>
        </TypographySwatch>

        <TypographySwatch title={`<p class="typo-enable-calt">`}>
          <p class="typo-enable-calt">100x20</p>
        </TypographySwatch>
      </Section>

      <Section title="Icons">
        <div
          style="display: grid; gap: 1.5rem; grid-template-columns: repeat(10, 1.5rem); grid-auto-rows: 1.5rem;">
          {#await importIconComponents(icons) then icons}
            {#each icons as icon}
              <Tooltip value={`${icon.name}.svelte`} position="top">
                <svelte:component this={icon.component} />
              </Tooltip>
            {/each}
          {/await}
        </div>
      </Section>

      <Section title="Components">
        <table>
          <thead>
            <tr>
              <td>
                <h5>Variant</h5>
              </td>
              <td>
                <h5>Disabled</h5>
              </td>
              <td>
                <h5>Variant</h5>
              </td>
              <td>
                <h5>Disabled</h5>
              </td>
            </tr>
          </thead>
          <tr>
            <td>
              <Button variant="primary">Primary</Button>
            </td>
            <td>
              <Button variant="primary" disabled>Primary</Button>
            </td>
            <td>
              <Button icon={MinusIcon} variant="primary">Primary</Button>
            </td>
            <td>
              <Button icon={MinusIcon} variant="primary" disabled>
                Primary
              </Button>
            </td>
          </tr>
          <tr>
            <td>
              <Button variant="vanilla">Vanilla</Button>
            </td>
            <td>
              <Button variant="vanilla" disabled>Vanilla</Button>
            </td>
            <td>
              <Button icon={PlusIcon} variant="vanilla">Vanilla</Button>
            </td>
            <td>
              <Button icon={PlusIcon} variant="vanilla" disabled
                >Vanilla</Button>
            </td>
          </tr>
          <tr>
            <td>
              <Button variant="outline">Outline</Button>
            </td>
            <td>
              <Button variant="outline" disabled>Outline</Button>
            </td>
            <td>
              <Button icon={ForkIcon} variant="outline">Outline</Button>
            </td>
            <td>
              <Button icon={ForkIcon} variant="outline" disabled
                >Outline</Button>
            </td>
          </tr>
          <tr>
            <td>
              <Button variant="transparent">Transparent</Button>
            </td>
            <td>
              <Button variant="transparent" disabled>Transparent</Button>
            </td>
            <td>
              <Button icon={CheckIcon} variant="transparent"
                >Transparent</Button>
            </td>
            <td>
              <Button icon={CheckIcon} variant="transparent" disabled>
                Transparent
              </Button>
            </td>
          </tr>
          <tr>
            <td>
              <Button variant="destructive">Destructive</Button>
            </td>
            <td>
              <Button variant="destructive" disabled>Destructive</Button>
            </td>
            <td>
              <Button icon={CrossIcon} variant="destructive"
                >Destructive</Button>
            </td>
            <td>
              <Button icon={CrossIcon} variant="destructive" disabled>
                Destructive
              </Button>
            </td>
          </tr>
        </table>

        <div class="swatch">
          <TextInput placeholder="Hey, I'm an input." style="width: auto;" />
        </div>

        <div class="swatch">
          <TextInput placeholder="Hey, I'm a full-width input." />
        </div>

        <div class="swatch">
          <TextInput
            placeholder="Hey, I'm a full-width input with a hint"
            hint="↵" />
        </div>

        <div class="swatch">
          <TextInput
            disabled
            placeholder="Hey, I'm a disabled input with a placeholder." />
        </div>

        <div class="swatch">
          <TextInput disabled value="I'm a disabled input with a value." />
        </div>

        <div class="swatch">
          <TextInput value="I have a..." suffix="suffix" />
        </div>

        <div class="swatch">
          <TextInput
            placeholder="I'm an input with a validation error."
            validationState={{
              type: "invalid",
              message: "That doesn't look good!",
            }} />
        </div>

        <div class="swatch">
          <TextInput
            placeholder="Enter user name"
            showSuccessCheck
            validationState={{ type: "valid" }} />
        </div>

        <div class="swatch">
          <TextInput
            placeholder="Enter user name"
            validationState={{ type: "pending" }}
            value="user123" />
        </div>

        <div class="swatch">
          <TextInput
            variant={{ type: "password" }}
            placeholder="Please enter a password" />
        </div>

        <div class="swatch">
          <TextInput
            variant={{ type: "password" }}
            value="my super long password" />
        </div>

        <div class="swatch">
          <TextInput
            variant={{ type: "password" }}
            value="too short"
            validationState={{
              type: "invalid",
              message: "Password too short.",
            }} />
        </div>

        <div class="swatch">
          <TextArea placeholder="I'm a textarea" caption="Markdown supported" />
        </div>

        <div class="swatch">
          <TextArea
            placeholder="I'm an invalid textarea"
            validationState={{
              type: "invalid",
              message: "Something is not valid.",
            }} />
        </div>

        <div class="swatch">
          <Checkbox>How about a checkbox?</Checkbox>
        </div>

        <div class="swatch">
          <Dropdown
            placeholder="Select option..."
            options={[
              { value: "1", title: "Option 1" },
              {
                value: "2",
                title: "Longer option keeps going",
              },
            ]} />
        </div>

        <div class="swatch">
          <Dropdown
            options={[{ value: "1", title: "Option 1" }]}
            placeholder="Select option..."
            disabled={true} />
        </div>

        <div class="swatch">
          <Tooltip value="Top" position="top">
            <Button variant="outline">Hover me!</Button>
          </Tooltip>
        </div>

        <div class="swatch">
          <Tooltip value="Right" position="right">
            <Button variant="outline">Hover me!</Button>
          </Tooltip>
        </div>

        <div class="swatch">
          <Tooltip value="Bottom" position="bottom">
            <Button variant="outline">Hover me!</Button>
          </Tooltip>
        </div>

        <div class="swatch">
          <Tooltip value="Left" position="left">
            <Button variant="outline">Hover me!</Button>
          </Tooltip>
        </div>

        <div class="swatch">
          <IdentifierLink
            params={{
              type: "transactionHash",
              url: "https://rinkeby.etherscan.io/tx/0xcf23b34a9f09245226c19114af534ee094b028922a1280003226fd98acb410ea",
              hash: "0xcf23b34a9f09245226c19114af534ee094b028922a1280003226fd98acb410ea",
            }} />
        </div>
        <div class="swatch">
          <IdentifierLink
            params={{
              type: "commitHash",
              hash: "20436154e1118b39f1b2bf3c049ab040ca910846",
              onClick: () => {},
            }} />
        </div>

        <div class="swatch">
          <ThreeDotsMenu
            style="margin-right: 1rem;"
            menuItems={[
              {
                title: "Add something",
                icon: PlusIcon,
                event: () => {},
                tooltip: "Here be tooltip",
              },
              {
                title: "Send something",
                icon: ArrowUpIcon,
                event: () => {},
                disabled: true,
              },
            ]} />

          <SupportButton style="margin-right: 1rem;" />

          <SegmentedControl
            active={"closed"}
            options={[
              {
                title: "Open",
                value: "open",
              },
              {
                title: "Closed",
                value: "closed",
              },
              {
                title: "All",
                value: "all",
              },
            ]} />
        </div>

        <div class="swatch">
          <TrackToggle disabled style="margin-right: 1rem;" />
          <TrackToggle disabled style="margin-right: 1rem;" tracking />
          <TrackToggle style="margin-right: 1rem;" />
          <TrackToggle tracking />
        </div>

        <div class="swatch">
          <LoadingAnimation />
        </div>
      </Section>

      <slot name="bottom" />
    </div>
  </div>
</div>
