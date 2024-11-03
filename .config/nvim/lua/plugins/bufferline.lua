return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    local options = opts.options
    options.indicator = { style = "icon", icon = "▎" }
    options.separator_style = { "", "" }
    options.buffer_close_icon = ""
    options.modified_icon = "●"
    options.close_icon = ""
    options.left_trunc_marker = ""
    options.right_trunc_marker = ""
    options.max_name_length = 20
    options.max_prefix_length = 15
    options.tab_size = 22
    options.show_buffer_close_icons = false
    options.show_close_icon = false
    options.always_show_bufferline = true
    opts.options = options
  end,
}
