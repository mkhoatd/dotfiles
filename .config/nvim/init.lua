-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.o.guifont = "JetbrainsMono Nerd Font:h11"
  vim.g.transparency = 0.9
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 20
  vim.g.neovide_floating_blur_amount_y = 20
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_trail_length = 0.8
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
end
