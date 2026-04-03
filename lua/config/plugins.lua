vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
})

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
    },
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",           --TODO: move root dir up one level
        ["."] = "set_root",              --TODO: set root to selected folder
        ["/"] = "fuzzy_finder",          --TODO: recursive filter
        ["D"] = "fuzzy_finder_directory", --TODO: filter directories only
        ["#"] = "fuzzy_sorter",          --TODO: sort by fzy algorithm
        ["f"] = "filter_on_submit",      --TODO: apply filter on submit
        ["<C-c>"] = "clear_filter",          --TODO: clear filter
        ["H"] = "toggle_hidden",         --TODO: show/hide hidden items
        ["[g"] = "prev_git_modified",     --TODO: jump to prev git-modified file
        ["]g"] = "next_git_modified",     --TODO: jump to next git-modified file
        ["i"] = "show_file_details",     --TODO: display file metadata
        ["oc"] = "order_by_created",      --TODO: sort by created date
        ["od"] = "order_by_diagnostics",  --TODO: sort by diagnostics
        ["og"] = "order_by_git_status",   --TODO: sort by git status
        ["om"] = "order_by_modified",     --TODO: sort by modified date
        ["on"] = "order_by_name",         --TODO: sort by name
        ["os"] = "order_by_size",         --TODO: sort by size
        ["ot"] = "order_by_type",         --TODO: sort by type
      },
    },
  },
  buffers = {
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",           --TODO: move root dir up one level
        ["."] = "set_root",              --TODO: set root to selected folder
        ["bd"] = "buffer_delete",         --TODO: delete buffer
        ["i"] = "show_file_details",     --TODO: display file metadata
      },
    },
  },
  git_status = {
    window = {
      mappings = {
        ["gA"] = "git_add_all",           --TODO: stage all changes
        ["ga"] = "git_add_file",          --TODO: stage file
        ["gu"] = "git_unstage_file",      --TODO: unstage file
        ["gU"] = "git_undo_last_commit",  --TODO: undo last commit
        ["gr"] = "git_revert_file",       --TODO: revert file changes
        ["gc"] = "git_commit",            --TODO: create commit
        ["gp"] = "git_push",              --TODO: push changes
        ["gg"] = "git_commit_and_push",   --TODO: commit and push
        ["gt"] = "git_toggle_file_stage", --TODO: toggle file staged status
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
      ["<2-LeftMouse>"] = "open",       --TODO: open file/expand folder (mouse)
      ["<cr>"] = "open",                --TODO: open file/expand folder (enter)
      ["C"] = "close_node",              --TODO: close node or parent
      ["z"] = "close_all_nodes",         --TODO: collapse all nodes

      -- Preview
      ["P"] = "toggle_preview",          --TODO: toggle preview mode
      ["l"] = "focus_preview",           --TODO: focus preview window
      ["<C-d>"] = "scroll_preview",          --TODO: scroll preview down
      ["<C-u>"] = "scroll_preview",          --TODO: scroll preview up (reverse)
      ["<esc>"] = "cancel",                  --TODO: close preview or float

      -- File operations
      ["a"] = "add",                     --TODO: create new file/directory
      ["A"] = "add_directory",           --TODO: create new directory
      ["d"] = "delete",                  --TODO: delete file/folder
      ["r"] = "rename",                  --TODO: rename file/folder
      ["y"] = "copy_to_clipboard",       --TODO: mark for copying
      ["x"] = "cut_to_clipboard",        --TODO: mark for cutting
      ["p"] = "paste_from_clipboard",    --TODO: paste marked files
      ["<C-x>"] = "clear_clipboard",         --TODO: clear clipboard
      ["c"] = "copy",                    --TODO: copy file/folder
      ["m"] = "move",                    --TODO: move file/folder

      -- Open in splits/tabs
      ["s"] = "open_split",              --TODO: open in horizontal split
      ["v"] = "open_vsplit",             --TODO: open in vertical split
      ["t"] = "open_tabnew",             --TODO: open in new tab
      ["w"] = "open_with_window_picker", --TODO: pick window to open in

      -- Other
      ["q"] = "close_window",            --TODO: close neo-tree window
      ["R"] = "refresh",                 --TODO: refresh tree
      ["?"] = "show_help",              --TODO: show mappings popup
      ["<"] = "prev_source",             --TODO: switch to prev source
      [">"] = "next_source",             --TODO: switch to next source
    },
  },
})

vim.keymap.set("n", "<leader>te", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
