return {
  {
    "terrastruct/d2-vim"
  },
  {
    "b0o/incline.nvim",
    -- dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      -- local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        -- highlight = {
        --     groups = {
        --         InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
        --         InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
        --     },
        -- },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.lsp = {
        signature = {
          enabled = false,
        },
      }
      opts.presets = {
        lsp_doc_border = false,
      }

      --     signature = {
      --         enabled = false,
      --     },
      -- }
      -- opts.presets = {
      --     lsp_doc_border
      -- }
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      -- filter out treesitter error
      table.insert(opts.routes, {
        filter = {
          event = "msg_show",
          find = "treesitter",
        },
        opts = { skip = true },
      })
      table.insert(opts.routes, {
        filter = {
          event = "msg_show",
          find = "lines",
        },
        opts = { skip = true },
      })
      table.insert(opts.routes, {
        filter = {
          event = "msg_show",
          find = "Plugin Updates",
        },
        opts = { skip = true },
      })
      -- table.insert(opts.routes, {
      --   filter = {
      --     event = "lsp",
      --     find = "Diagnosing",
      --   },
      --   opts = { skip = true },
      -- })
      -- table.insert(opts.routes, {
      --   filter = {
      --     event = "lsp",
      --     find = "Loading workspace",
      --   },
      --   opts = { skip = true },
      -- })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return focused
          end,
        },
        -- view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
      -- opts.lsp.signature.enabled = false
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
}
