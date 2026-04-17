vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
})

require("treesitter-context").setup({ mode = "cursor", max_lines = 3 })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#363841" })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = "#8787af", bg = "#363841" })

-- Telescope fuzzy finder
require("telescope").setup({
  extensions = {
    fzf = {},
  },
})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Find string under cursor/selection" })

-- Mason + LSP
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "jedi_language_server", "harper_ls" },
})

-- LSP keymaps — attached when an LSP server connects to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float({ focus = false }) end, vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
  end,
})

-- Configure LSP servers via built-in vim.lsp.config (Neovim 0.12+)
vim.lsp.config("jedi_language_server", {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jedi-language-server") },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
})

vim.lsp.config("harper_ls", {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/harper-ls"), "--stdio" },
  filetypes = { "markdown" },
  root_markers = { ".git" },
})

vim.lsp.enable("jedi_language_server")
vim.lsp.enable("harper_ls")

-- Neo-tree styling
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#87afd7" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#87afd7" })
vim.api.nvim_set_hl(0, "NeoTreeHiddenByName", { fg = "#626262" })
vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#dadada", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#d7af5f" })

require("neo-tree").setup({
  git_status_async = true,
  filesystem = {
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = true,
      hide_dotfiles = true,
    },
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",           --move root dir up one level
        ["."] = "set_root",              --set root to selected folder
        ["/"] = "fuzzy_finder",          --recursive filter
        ["D"] = "fuzzy_finder_directory", --filter directories only
        ["#"] = "fuzzy_sorter",          --sort by fzy algorithm
        ["f"] = "filter_on_submit",      --apply filter on submit
        ["<C-c>"] = "clear_filter",          --clear filter
        ["H"] = "toggle_hidden",         --show/hide hidden items
        ["[g"] = "prev_git_modified",     --jump to prev git-modified file
        ["]g"] = "next_git_modified",     --jump to next git-modified file
        ["i"] = "show_file_details",     --display file metadata
        ["oc"] = "order_by_created",      --sort by created date
        ["od"] = "order_by_diagnostics",  --sort by diagnostics
        ["og"] = "order_by_git_status",   --sort by git status
        ["om"] = "order_by_modified",     --sort by modified date
        ["on"] = "order_by_name",         --sort by name
        ["os"] = "order_by_size",         --sort by size
        ["ot"] = "order_by_type",         --sort by type
      },
    },
  },
  buffers = {
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",           --move root dir up one level
        ["."] = "set_root",              --set root to selected folder
        ["bd"] = "buffer_delete",         --delete buffer
        ["i"] = "show_file_details",     --display file metadata
      },
    },
  },
  git_status = {
    window = {
      mappings = {
        ["gA"] = "git_add_all",           --stage all changes
        ["ga"] = "git_add_file",          --stage file
        ["gu"] = "git_unstage_file",      --unstage file
        ["gU"] = "git_undo_last_commit",  --undo last commit
        ["gr"] = "git_revert_file",       --revert file changes
        ["gc"] = "git_commit",            --create commit
        ["gp"] = "git_push",              --push changes
        ["gg"] = "git_commit_and_push",   --commit and push
        ["gt"] = "git_toggle_file_stage", --toggle file staged status
      },
    },
  },
  window = {
    mapping_options = {
      nowait = false,
    },
    mappings = {
      -- Navigation
      ["<space>"] = {
        "toggle_node",             
        nowait = false,
      },
      ["<2-LeftMouse>"] = "open",       --open file/expand folder (mouse)
      ["<cr>"] = "open",                --open file/expand folder (enter)
      ["C"] = "close_node",              --close node or parent
      ["z"] = "close_all_nodes",         --collapse all nodes

      -- Preview
      ["P"] = "toggle_preview",          --toggle preview mode
      ["l"] = "focus_preview",           --focus preview window
      ["<C-d>"] = "scroll_preview",          --scroll preview down
      ["<C-u>"] = "scroll_preview",          --scroll preview up (reverse)
      ["<esc>"] = "cancel",                  --close preview or float

      -- File operations
      ["a"] = "add",                     --create new file/directory
      ["A"] = "add_directory",           --create new directory
      ["d"] = "delete",                  --delete file/folder
      ["r"] = "rename",                  --rename file/folder
      ["y"] = "copy_to_clipboard",       --mark for copying
      ["x"] = "cut_to_clipboard",        --mark for cutting
      ["p"] = "paste_from_clipboard",    --paste marked files
      ["<C-x>"] = "clear_clipboard",         --clear clipboard
      ["c"] = "copy",                    --copy file/folder
      ["m"] = "move",                    --move file/folder

      -- Open in splits/tabs
      ["s"] = "open_split",              --open in horizontal split
      ["v"] = "open_vsplit",             --open in vertical split
      ["t"] = "open_tabnew",             --open in new tab
      ["w"] = "open_with_window_picker", --pick window to open in

      -- Other
      ["q"] = "close_window",            --close neo-tree window
      ["R"] = "refresh",                 --refresh tree
      ["?"] = "show_help",              --show mappings popup
      ["<"] = "prev_source",             --switch to prev source
      [">"] = "next_source",             --switch to next source
    },
  },
})

vim.keymap.set("n", "<leader>te", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
