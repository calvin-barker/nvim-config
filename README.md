# nvim-config

My **shiny and new** `nvim` config as of March 2026.

## Dependencies

```sh
brew install neovim harper prettier
```

## Getting Started

As the default `nvim` config:

```sh
# Clone the config repo.
git clone https://github.com/calvin-barker/nvim ~/.config/nvim

# Start Neovim.
nvim
```

As a separate `nvim` configuration:

```sh
# Clone the config repo.
git clone https://github.com/calvin-barker/nvim ~/.config/nnvim

# Create an alias for `nnvim`
echo "alias nnvim='NVIM_APPNAME=nnvim nvim'" >> ~/.zshrc

# Start Neovim.
nnvim
```

## Key Mappings Conventions

Leader is `<Space>`. Key maps are defined in `lua/config/keymaps.lua` and follow the convention
`<leader><verb><object>`.

_I recognize these terms are conceptually the same as "operators" and "motions," but I prefer the familiarity of
grammatical terminology._
