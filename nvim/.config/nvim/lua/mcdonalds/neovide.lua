local g = vim.g

if g.neovide then
    vim.o.guifont = "CaskaydiaMono\\ Nerd\\ Font:h16"

    g.neovide_hide_mouse_when_typing = true
    g.neovide_refresh_rate = 120
    g.neovide_remember_window_size = true

    g.neovide_scroll_animation_length = 0.1
    g.neovide_cursor_animation_length = 0.1
    g.neovide_cursor_trail_size = 0.5
    g.neovide_cursor_vfx_mode = "sonicboom"
end
