# nnvim

My **`n`ew** `nvim` config.

## Getting Started

As the default `nvim` config:

```sh
# Clone the config repo.
git clone https://github.com/calvin-barker/nnvim ~/.config/nvim

# Start Neovim.
nvim
```

As a separate `nvim` configuration:

```sh
# Clone the config repo.
git clone https://github.com/calvin-barker/nnvim ~/.config/nnvim

# Create an alias for `nnvim`
echo "alias nnvim='NVIM_APPNAME=nnvim nvim'" >> ~/.zshrc

# Start Neovim.
nnvim
```

## Key Mappings

Leader is `<Space>`. Key maps are defined in `lua/config/keymaps.lua` and follow the convention `<leader><namespace><action>`.

| Mapping | Description |
| --- | --- |
| `<leader>ts` | Toggle spellcheck |
| `<leader>tw` | Toggle line wrapping |
| `<leader>tc` | Toggle markdown conceal |
| `<leader>w` | Write file |
| `<leader>q` | Quit window |
| `<Esc>` | Clear search highlight |
