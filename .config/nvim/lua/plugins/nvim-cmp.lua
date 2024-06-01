local border = {
  completion = {
    border = {
      { "󱐋", "WarningMsg" },
      { "─", "Comment" },
      { "╮", "Comment" },
      { "│", "Comment" },
      { "╯", "Comment" },
      { "─", "Comment" },
      { "╰", "Comment" },
      { "│", "Comment" },
    },
    scrollbar = false,
  },
  documentation = {
    border = {
      { "", "DiagnosticHint" },
      { "─", "Comment" },
      { "╮", "Comment" },
      { "│", "Comment" },
      { "╯", "Comment" },
      { "─", "Comment" },
      { "╰", "Comment" },
      { "│", "Comment" },
    },
    scrollbar = false,
  },
}

return {
  {
    "onsails/lspkind.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<CR>", false },
      { "<S-CR>", false },
      { "<CR>", vim.NIL },
      { "<S-CR>", vim.NIL },
    },
    dependencies = {
      "hrsh7th/cmp-path",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      opts.completion = {
        completeopt = "menu,menuone,preview,noinsert",
      }
      opts.window = border
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({
              behavior = cmp.SelectBehavior.Insert,
            })
          else
            fallback()
          end
        end),
        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({
              behavior = cmp.SelectBehavior.Insert,
            })
          else
            fallback()
          end
        end),
      })
      opts.formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      }
      -- for i, v in ipairs(opts.sources) do
      --   if v.name == "path" then
      --     opts.sources[i] = {
      --       name = "path",
      --       option = {
      --         get_cwd = function(params)
      --           return vim.fn.getcwd()
      --         end,
      --       },
      --     }
      --   end
      -- end
      local newMapping = {}
      for k, v in pairs(opts.mapping) do
        if k ~= "<CR>" then
          newMapping[k] = v
        end
      end
      opts.mapping = newMapping
    end,
  },
}
