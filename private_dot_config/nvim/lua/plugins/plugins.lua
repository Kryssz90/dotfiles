local plugins = {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "zbirenbaum/copilot.lua",
    -- Lazy load when event occurs. Events are triggered
    -- as mentioned in:
    -- https://vi.stackexchange.com/a/4495/20389
    event = "InsertEnter",
    -- You can also have it load at immediately at
    -- startup by commenting above and uncommenting below:
    -- lazy = false
    opts = {
      suggestion = {
        auto_trigger = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end
  },
  {
    'markwoodhall/vim-codelens'
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    config = function()
      vim.g.table_mode_corner = '|'
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local nvimtree = require("nvim-tree")

      nvimtree.setup({
        view = {
          width = 30,
          side = 'left',
        },
        update_focused_file = {
          enable = true,
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        git = {
          ignore = false
        }

      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })

      --      telescope.load_extension("fzf")
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys= {
      { "<leader>tx", "<cmd>TroubleToggle<cr>", desc = "Open/close trouble list" },
      { "<leader>tw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", desc = "Open/close workspace diagnostics" },
      { "<leader>td", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", desc = "Open/close document diagnostics" },
      { "<leader>tl", "<cmd>TroubleToggle loclist<cr>", desc = "Open/close loclist" },
      { "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "Open/close quickfix" },
      { "<leader>gr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Open/close references" },
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({

        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        ensure_installed = {
          "bash",
          "css",
          "dockerfile",
          "go",
          "gomod",
          "html",
          "javascript",
          "json",
          "lua",
          "python",
          "rust",
          "scss",
          "toml",
          "tsx",
          "typescript",
          "yaml",
          "markdown",

        },
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event={"BufReadPre", "BufNewFile"},
    main="ibl",
    opts={
      indent={
        char='',
      }
    }
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, {buffer = bufnr, desc = desc})
        end

        map("n", "3h", gs.next_hunk, "Next Hunk")
        map("n", "1h", gs.prev_hunk, "Prev Hunk")

        map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
        map("v", "<leader>hs", function()
          gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")})
        end, "Stage Hunk")
        map("v", "<leader>hr", function()
          gs.reset_hunk({vim.fn.line("."), vim.fn.line("v")})
        end, "Reset Hunk")

        map("n", "<leader>hb", gs.blame_line, "Blame")

      end
    }
  }




}

return plugins
