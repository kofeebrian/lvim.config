reload("user.config")

lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true

-- Sytles
lvim.transparent_window = true

-- Emmet (Shorthand HTML)
local emmet_options = {
  -- capabilities = capabilities,
  filetypes = {
    "html",
    "javascriptreact",
    "typescriptreact",
    "xml",
  },
  root_dir = function()
    return vim.loop.cwd()
  end
}
require("lvim.lsp.manager").setup("emmet_ls", emmet_options)

-- WGSL (WebGPU)
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})
require("lvim.lsp.manager").setup("wgsl_analyzer")

-- Disable typescript suggestion code 80001
require('lspconfig').tsserver.setup({
  on_attach = function(client)
    require('nvim-lsp-ts-utils').setup({
      filter_out_diagnostics_by_code = { 80001 },
    })
    require('nvim-lsp-ts-utils').setup_client(client)
  end,
})

-- Plugins
--------------------------------------------------------------
lvim.plugins = {
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
  "folke/trouble.nvim",
  "nvim-telescope/telescope.nvim",
  "stevearc/dressing.nvim",
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        autotag = {
          enable = true,
          filetypes = { 'html', 'xml', 'javascriptreact', 'typescriptreact' }
        }
      })
    end,
  },
  {
    "tpope/vim-surround",
    init = function()
      vim.o.timeoutlen = 500
    end
  },
  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = true
  },
  -- Discord Presence
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({
        -- General options
        auto_update         = true,
        neovim_image_text   = "Lunarvim is Bery Guddo!",
        main_image          = "neovim",
        client_id           = "793271441293967371",
        log_level           = nil,
        debounce_timeout    = 10,
        enable_line_number  = true,
        blacklist           = {},
        buttons             = true,
        file_assets         = {},
        show_time           = true,
        -- Rich Presence text options
        editing_text        = "Editing %s",
        file_explorer_text  = "Browsing %s",
        git_commit_text     = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text        = "Reading %s",
        workspace_text      = "Working on %s",
        line_number_text    = "Line %s out of %s",
      })
    end
  },
}

-- Copilot
table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()
      require("copilot_cmp").setup()
    end, 100)
  end,
})

table.insert(lvim.plugins, {
  'mg979/vim-visual-multi'
})
