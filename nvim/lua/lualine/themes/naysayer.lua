local c = require("colors.naysayer")

return {
  normal = {
    a = { fg = c.lualine_fg, bg = c.lualine_bg, gui = "bold" },
    b = { fg = c.lualine_bg, bg = c.lualine_fg },
    c = { fg = c.lualine_bg, bg = c.lualine_fg },
  },
  insert = {
    a = { fg = c.lualine_fg, bg = c.lualine_insert, gui = "bold" },
    b = { fg = c.lualine_bg, bg = c.lualine_fg },
    c = { fg = c.lualine_bg, bg = c.lualine_fg },
  },
  visual = {
    a = { fg = c.lualine_fg, bg = c.lualine_visual, gui = "bold" },
    b = { fg = c.lualine_bg, bg = c.lualine_fg },
    c = { fg = c.lualine_bg, bg = c.lualine_fg },
  },
  replace = {
    a = { fg = c.lualine_fg, bg = c.lualine_replace, gui = "bold" },
    b = { fg = c.lualine_bg, bg = c.lualine_fg },
    c = { fg = c.lualine_bg, bg = c.lualine_fg },
  },
  inactive = {
    a = { fg = c.line_fg, bg = c.gutter, gui = "bold" },
    b = { fg = c.line_bg, bg = c.gutter },
    c = { fg = c.line_bg, bg = c.gutter },
  },
}
