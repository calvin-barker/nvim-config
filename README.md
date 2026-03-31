# nvim-config

My **shiny and new** `nvim` config as of March 2026.

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

Leader is `<Space>`. Key maps are defined in `lua/config/keymaps.lua` and follow the convention `<leader><verb><object>`.

*I recognize these terms are conceptually the same as "operators" and "motions," but I prefer the familiarity of grammatical terminology.*

| Verb | Key | Definition |
| --- | --- | --- |
| toggle | t | a key or command that toggles between two modes |
| write | w | enter (data) into an electronic or magnetic storage device, or into a particular location in a computer’s file system |
| quit | q | stop or discontinue (an action or activity) |

### List of Mappings

| Mapping | Description |
| --- | --- |
| `<leader>ts` | Toggle spellcheck |
| `<leader>tw` | Toggle line wrapping |
| `<leader>tc` | Toggle markdown conceal |
| `<leader>w` | Write file |
| `<leader>q` | Quit window |
| `<Esc>` | Clear search highlight |
