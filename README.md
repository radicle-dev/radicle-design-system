## Radicle Design System 🎨

A showcase of the latest version is deployed [here][dp].

## Getting started

Add this to your `package.json`:
```
{
  "dependencies": {
    "radicle-design-system": "https://github.com/radicle-dev/radicle-design-system",
  },
  "scripts": {
    "postinstall": "scripts/install-twemoji-assets.sh && scripts/install-design-system-static-assets.sh"
  }
}
```

If you're using yarn v2, configure yarn to use the `node-modules` linker to
ensure that assets are stored in your project's `node_modules` by running:

```
yarn config set nodeLinker node-modules
```

Then, create the following scripts and make sure they're executable:

- `scripts/install-twemoji-assets.sh`
```
#!/bin/bash
# Download the Twemoji SVGs and put them into public/twemoji.

set -Eeou pipefail
version="$(node -e 'console.log(require("twemoji/package.json").version)')"
echo "Installing Twemoji SVG assets v${version}"

curl -sSL "https://github.com/twitter/twemoji/archive/refs/tags/v${version}.tar.gz" \
  | tar -x -z -C public/twemoji/ --strip-components=3 "twemoji-${version}/assets/svg"
```

- `scripts/install-design-system-static-assets.sh`
```
#!/bin/bash
# Install design system assets.

set -Eeou pipefail
echo "Installing Radicle Design System assets"
cp ./node_modules/radicle-design-system/static/*.css ./public/styles
cp ./node_modules/radicle-design-system/static/fonts/*.otf ./public/fonts
```

Adjust the paths of the assets according to the requirements of your project
and import all of the CSS files in your project root `index.html`.

Note: Instead of serving the files and importing them client-side, you may also
require the css files directly from `node_modules` if your bundler is set up to
import `.css` files. To do so, just `import` the css files directly from the
`radicle-design-system` package:

```
import 'radicle-design-system/static/reset.css';
import 'radicle-design-system/static/global.css';
import 'radicle-design-system/static/colors.css';
import 'radicle-design-system/static/elevation.css';
import 'radicle-design-system/static/typography.css';
```

This will work out of the box on `sveltekit`. If you import the css files
directly from the package, you can remove the following line:
```
cp ./node_modules/radicle-design-system/static/*.css ./public/styles
```
from the `install-design-system-static-assets.sh` script described above.

Finally, run `yarn install`. Now you can start using the components and
utility functions provided by the design system like this:

```
<script>
  import * as format from 'radicle-design-system/lib/format.ts';
  import Button from 'radicle-design-system/Button.svelte';
</script>

<Button>Hello world!</Button>
{format.shortPeerId("hyyo6u8rhnuswory4c6symx471yseke74oq1myfesoig7zggcixejy")}
```


## Colors

The design system supports multiple color palettes via themes which can be
changed by adding a `data-theme` attribute to your html document:
```
<html data-theme="light">
</html>
```

Currently the design system supports the `light`, `dark` and `h4x0r` themes.
Read more about the colors [here][cs].


## Typography

The design system provides a constrained set of typographic styles. This
consists of a set of styled headers, a set of styled paragraphs and a set of
modifiers. These also overlap with the components we have in our design system
in Figma, where the design of the app exists. All classes are prefixed with
`typo-` so this might be helpful if you have any autocomplete in your editor.

For the headers you can just use `<h1>` up to `<h5>`, if you want to apply the
same styles to other html elements you can use the matching classes
`typo-header-1` to `typo-header-5` (use `<h1>` to `<h5>` where you can).

For text you can use the classes that start with `typo-text`. These come in
2 sizes, the normal one and `typo-text-small`. Check out
[typography.css][ty] to get an idea of the possible
combinations. All the ones we're using in Figma are represented here.

The modifiers give us some flexibility and allow us to create classes for
certain css functionality we use over and over. Such as,
`typo-overflow-ellipsis` and `typo-all-caps`. These should be self-explanatory.

We also added a set of modifiers that allow you to add the font-family as a
class where you need it, here again we would recommend not doing that as most
styles should fit into one of the two categories above.


## Contributing to design

Since Radicle is an open source project, anyone can contribute. This is normal
in open source development, but we do it for design too!

  - Start by joining our [Discord server][dc] to chat with anyone on the core
    team and ask any questions you have. It’s all public and open for anyone to
    join and chat. We even have our "internal" chats in public where we chat
    regularly about features.

  - If you need any help getting set up with our [Figma file][ff] just ask one
    of the core designers on the team [@brandonhaslegs][bo] or
    [@juliendonck][jd]. You’ll need to duplicate the file and make changes in
    your own private file. If we accept them, we’ll integrate them into the
    official file.

  - Please submit design solutions on GitHub. Just post screenshots, videos, or
    Figma prototype links of your solution and a description on the issue.


## Attribution

The Radicle Design System uses:
  - [Twemoji by Twitter][tw]
  - [The Inter typeface family by Rasmus Andersson][ra]
  - [Source Code Pro font family by Adobe][so]


[bo]: https://github.com/brandonhaslegs
[cs]: https://radicle.community/t/color-system/166
[dc]: https://discord.com/channels/841318878125490186/841318878650302490
[dp]: https://radicle-dev.github.io/radicle-design-system
[ff]: https://www.figma.com/file/owmgsbs6lnUt8R1bixstCA/Radicle?node-id=0%3A1
[jd]: https://github.com/juliendonck
[ra]: https://rsms.me/inter
[so]: https://adobe-fonts.github.io/source-code-pro
[tw]: https://twemoji.twitter.com
[ty]: ./static/typography.css
