local avante = require('avante')

avante.setup({
  auto_suggestions_provider = "openai",
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o-mini-2024-07-18",
    timeout = 30000, -- Timeout in milliseconds
    temperature = 0,
    max_tokens = 4096,
    ["local"] = false,
  },
})
