local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
    custom_captures = {
      ["punctuation.bracket"] = "",
      ["constructor"] = "",
    },
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    'tsx', 'lua', 'json', 'css', "vim", "vimdoc", "query", "javascript",
    "typescript", "ruby", "dockerfile", "graphql", "json", "sql", "html",
    "graphql", "yaml"
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = { 'cpp', },
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
    hlgroups = {
      'TSRainbowBlue',
      'TSRainbowYellow',
      'TSRainbowRed',
      'TSRainbowOrange',
      'TSRainbowGreen',
      'TSRainbowViolet',
      'TSRainbowCyan'
    },
  },
  playground = { enable = true },
}
