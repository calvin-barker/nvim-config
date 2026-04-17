# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim 0.12+ configuration. It can run as the default `nvim` config or side-by-side via `NVIM_APPNAME=nnvim nvim`.

## Architecture

- `init.lua` — Entry point. Loads `config.options`, `config.keymaps`, `config.filetypes`, `config.plugins`.
- `lua/config/options.lua` — Global editor options, colorscheme (`sorbet`), folding, and statuscolumn.
- `lua/config/keymaps.lua` — Key mappings. Leader is `<Space>`. Convention: `<leader><namespace><action>` (e.g., `<leader>t` = toggle namespace, `<leader>f` = find, `<leader>g` = go-to).
- `lua/config/plugins.lua` — Plugin management via `vim.pack` and plugin configuration (neo-tree, telescope, Mason, LSP via `vim.lsp.enable()`).
- `after/ftplugin/` — Filetype-specific overrides (e.g., `markdown.lua` for Prettier formatting, heading navigation and highlights).

## External Dependencies

Installed via Homebrew. Keep this list updated when adding features that require external tools.

- `neovim` — editor (0.12+)
- `harper` — grammar/spell checker LSP for markdown (`harper-ls`, also managed by Mason)
- `prettier` — markdown autoformatting
- `ripgrep` — required by Telescope for live grep

LSP servers (jedi_language_server, harper_ls) are managed by Mason and auto-installed on first launch.

## Conventions

- Indentation: 2 spaces (tabs expanded), matching the config's own `tabstop`/`shiftwidth`.
- Keymaps use `vim.keymap.set` with `desc` for discoverability.
- New keymaps should follow the `<leader><namespace><action>` pattern documented in README.md.
- Custom highlight colors must be consistent with the `sorbet` colorscheme palette. To find available colors, run `nvim --headless -c "colorscheme sorbet" -c "highlight" -c "q"` and use the `guifg`/`guibg` values from existing highlight groups. Avoid red (`#d75f5f`) for non-error contexts.
- When adding features that require external tools, document them in the External Dependencies section above.
