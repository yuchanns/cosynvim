local config = {}

function config.lspsaga()
  require("lspsaga").init_lsp_saga({
    move_in_saga = { prev = "k", next = "j" },
    saga_winblend = 20,
    diagnostic_header = { " ", " ", " ", "ﴞ " },
  })
end

function config.compe()
  -- dictionary
  local dict = require("cmp_dictionary")
  dict.setup({
    exact = 2,
    first_case_insensitive = false,
    document = false,
    document_command = "wn %s -over",
    async = false,
    max_items = -1,
    capacity = 5,
    debug = false,
  })
  dict.switcher({ spelllang = { en = vim.fn.stdpath("data") .. "/lspconfig/en.dict" } })
  local cmp = require("cmp")
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      -- { name = "vsnip" }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = "ultisnips" }, -- For ultisnips users.
      -- { name = "snippy" }, -- For snippy users.
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "path" },
      -- { name = "cmdline" },
      { name = "dictionary" },
    }),
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    },
  })
end

function config.codegpt()
  vim.g["codegpt_openai_api_provider"] = "azure"
  vim.g["codegpt_chat_completions_url"] =
    "https://yuchanns-openai.openai.azure.com/openai/deployments/gpt4/chat/completions?api-version=2023-03-15-preview"
  -- custom commands
  vim.g["codegpt_commands"] = {
    -- compatible to yetone's [openai-translator](https://github.com/yetone/openai-translator)
    ["translate"] = {
      system_message_template = "You are a translation engine that can only translate text and cannot interpret it.",
      user_message_template = "translate this text to Chinese:\n {{text_selection}}",
      callback_type = "text_popup",
    },
    ["polish"] = {
      system_message_template = "Revise the following sentences to make them more clear, concise, and coherent.",
      user_message_template = "polish this text in English:\n {{text_selection}}",
      callback_type = "text_popup",
    },
    ["expand"] = {
      user_message_template = "I have the following {{language}} macro:```{{filetype}}\n{{text_selection}}```\nUse some example inputs to demonstrate the result of macro expansion and explain it in Chinese. Only return the result and explanation.",
      callback_type = "text_popup",
    },
  }
end

return config
