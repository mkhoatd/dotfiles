return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = "kevinhwang91/nvim-ufo",
    init = function()
      -- local ok, wf = pcall(require, "vim.lsp._watchfile")
      -- if ok then
      --   -- disable lsp watcher. Too slow on linux
      --   wf._watchfunc = function()
      --     return function() end
      --   end
      -- end
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local builtin = require("telescope.builtin")
      -- change a keymap
      keys[#keys + 1] = { "gI", builtin.lsp_implementations }
      -- keys[#keys + 1] = { "<C-j>",}
      -- keys[#keys + 1] = { "K", false }
    end,
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = true,
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      -- codelens = {
      --   enabled = true,
      -- },
      -- tinymist = {
      --   single_file_support = true,
      --   root_dir = function()
      --     return vim.fn.getcwd()
      --   end,
      --   -- settings = {
      --   --   exportPdf = "onType",
      --   --   outputPath = "$root/target/$dir/$name",
      --   -- },
      -- },
      ---@type lspconfig.options
      servers = {
        tinymist = {
          --- todo: these configuration from lspconfig maybe broken
          single_file_support = true,
          root_dir = function()
            return vim.fn.getcwd()
          end,
          --- See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/Configuration.md) for references.
          settings = {},
        },
        --- @type lspconfig.options.lua_ls
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
              },
              codeLens = {
                enable = false,
              },
            },
          },
        },
      },
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
      opts = {},
      config = function(_, opts)
        opts.bind = true
        opts.handler_opts = {
          border = "rounded",
        }
        require("lsp_signature").setup(opts)
      end,
    },
  },
}
---@type lspconfig.options.fsautocomplete
-- fsautocomplete = {
--   settings = {
--     FSharp = {
--       inlayHints = {
--         enabled = true,
--         parameterNames = true,
--         typeAnnotations = true,
--         disableLongTooltip = true,
--       },
--       smartIndent = true,
--       enableAnalyzers = true,
--       infoPanelReplaceHover = true,
--       unusedOpensAnalyzer = true,
--       codeLenses = {
--         signature = {
--           enabled = true,
--         },
--         references = {
--           enabled = true,
--         },
--       },
--     },
--     Fsharp = {
--       fsac = {
--         sourceTextImplementationn = true,
--       },
--     },
--   },
-- },
--        ---@type lspconfig.options.tsserver
-- tsserver = {
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = vue_language_server_path,
--         languages = { "vue" },
--       },
--     },
--   },
--   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
--   settings = {
--     typescript = {
--       inlayHints = {
--         includeInlayParameterNameHints = "all",
--         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayVariableTypeHintsWhenTypeMatchesName = true,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--     javascript = {
--       inlayHints = {
--         includeInlayParameterNameHints = "all",
--         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayVariableTypeHintsWhenTypeMatchesName = true,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--   },
-- },
-- --- @type lspcoonfig.options.gopls
-- gopls = {
--   settings = {
--     hints = {
--       rangeVariableTypes = true,
--       parameterNames = true,
--       constantValues = true,
--       assignVariableTypes = true,
--       compositeLiteralFields = true,
--       compositeLiteralTypes = true,
--       functionTypeParameters = true,
--     },
--   },
-- },
