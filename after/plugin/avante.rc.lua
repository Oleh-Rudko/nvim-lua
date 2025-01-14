local avante = require('avante')

avante.setup({
  provider = "openai",
  model = "gpt-4-1106-preview",
  openai = {
    api_key = vim.env.OPENAI_API_KEY,
    endpoint = "https://api.openai.com/v1",
    timeout = 30000,
    temperature = 0.2,
    max_tokens = 4096,
  },
  enable_suggestions = true,
  disable_anthropic = true,
})
