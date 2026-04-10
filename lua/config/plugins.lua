vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
})

require("treesitter-context").setup()
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#363841" })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = "#8787af", bg = "#363841" })

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
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
