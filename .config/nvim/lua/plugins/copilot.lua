return {

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = function(_, opts)
      opts.context = "buffers"
    end,
  },
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       dependencies = "copilot.lua",
  --     },
  --   },
  --   opts = function(_, opts)
  --     for i, v in ipairs(opts.sources) do
  --       if(v.name == "copilot") then
  --         opts.sources[i].priority = 10
  --       end
  --     end
  --   end,
  -- },
}
