// Copyright © 2022 The Radicle Design System Contributors
//
// This file is part of radicle-design-system, distributed under the GPLv3
// with Radicle Linking Exception. For full terms see the included
// LICENSE file.

import { writable } from "svelte/store";

interface Option<T> {
  value: T;
  title: string;
}

type Theme = "dark" | "light" | "h4x0r";

export const theme = writable<Theme>("dark");

export const themeOptions: Option<Theme>[] = [
  {
    title: "Light",
    value: "light",
  },
  {
    title: "Dark",
    value: "dark",
  },
  {
    title: "H4x0r",
    value: "h4x0r",
  },
];

type UiFont = "inter" | "system";

export const uiFont = writable<UiFont>("inter");

export const uiFontOptions: Option<UiFont>[] = [
  {
    title: "Inter",
    value: "inter",
  },
  {
    title: "System",
    value: "system",
  },
];

type CodeFont = "sourceCode" | "system";

export const codeFont = writable<CodeFont>("sourceCode");

export const codeFontOptions: Option<CodeFont>[] = [
  {
    title: "Source Code",
    value: "sourceCode",
  },
  {
    title: "System",
    value: "system",
  },
];

type PrimaryColor = "blue" | "pink" | "orange" | "custom";

export const primaryColor = writable<PrimaryColor>("blue");

export const primaryColorOptions: Option<PrimaryColor>[] = [
  { title: "Blue", value: "blue" },
  { title: "Pink", value: "pink" },
  { title: "Orange", value: "orange" },
  { title: "Custom", value: "custom" },
];

export const primaryColorHex = writable<string>("#5555FF");
