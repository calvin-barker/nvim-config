# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration ("nnvim") — a minimal, plugin-free setup. It can run as the default `nvim` config or side-by-side via `NVIM_APPNAME=nnvim nvim`.

## Architecture

- `init.lua` — Entry point. Loads `config.options` then `config.keymaps`.
- `lua/config/options.lua` — Global editor options and colorscheme (`sorbet`).
- `lua/config/keymaps.lua` — Key mappings. Leader is `<Space>`. Convention: `<leader><namespace><action>` (e.g., `<leader>t` = toggle namespace).
- `after/ftplugin/` — Filetype-specific overrides (e.g., `markdown.lua` enables spell, wrap, linebreak).

## Conventions

- Indentation: 2 spaces (tabs expanded), matching the config's own `tabstop`/`shiftwidth`.
- Keymaps use `vim.keymap.set` with `desc` for discoverability.
- New keymaps should follow the `<leader><namespace><action>` pattern documented in README.md.
