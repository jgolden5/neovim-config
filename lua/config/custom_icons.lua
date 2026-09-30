local day_of_the_week = os.date("%A")

local colors = {
  Monday = "#00DD00",    -- Green
  Tuesday = "#DDDD00",   -- Yellow
  Wednesday = "#0000FF", -- Blue
  Thursday = "#FF0000",  -- Red
  Friday = "#008080",    -- Teal
  Saturday = "#800080",  -- Purple
  Sunday = "#888888",    -- White
}

local icon_color = colors[day_of_the_week] or "#000000"

require("nvim-web-devicons").setup({
  override_by_extension = {
    codes = {
      icon = "▶",
      color = icon_color,
      name = "CodesFile",
    },
  },
})
