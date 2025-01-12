local system = require("utils.system")

local build = "make BUILD_FROM_SOURCE=true"
if system.is_windows() then
  build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
end

return {
  "yetone/avante.nvim",
  build = build,
  event = "VeryLazy",
  opts = {
    provider = "copilot",
    auto_suggestions_provider = "azure",
    copilot = {
      model = "claude-3.5-sonnet",
    },
    azure = {
      endpoint = "https://yuchanns-eastus.openai.azure.com",
      deployment = "gpt-4o-mini",
      model = "gpt-4o-mini",
      api_version = "2024-05-01-preview",
      temperature = 0,
      max_tokens = 4096,
    },
    behaviour = {
      support_paste_from_clipboard = true,
      auto_suggestions = false,
    },
    mappings = {
      ask = "ca",
      edit = "ce",
      refresh = "cr",
      diff = {
        ours = "co",
        theirs = "ct",
        none = "c0",
        both = "cb",
        next = "]x",
        prev = "[x",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
    },
  },
  dependencies = {
    "github/copilot.vim",
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true
        },
      },
    },
    --- The below is optional, make sure to setup it properly if you have lazy=true
    {
      'OXY2DEV/markview.nvim',
      opts = {
        filetypes = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  }
}
