local package = require("core.pack").package
local conf = require("modules.tools.config")

package({
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = conf.telescope,
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    {
      "AckslD/nvim-neoclip.lua",
      config = conf.neoclip,
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      config = conf.frecency,
      dependencies = { { "kkharji/sqlite.lua" } },
    },
  },
})
package({ "windwp/nvim-autopairs", config = conf.autopairs })
package({ "Pocco81/auto-save.nvim", config = conf.autosave, branch = "dev" })
package({ "karb94/neoscroll.nvim", config = conf.neoscroll })
package({ "akinsho/nvim-toggleterm.lua", config = conf.toggleterm })
package({ "tpope/vim-surround" })
package({ "b3nj5m1n/kommentary" })
package({ "FotiadisM/tabset.nvim", config = conf.tabset })
package({ "wakatime/vim-wakatime" })
package({ "mg979/vim-visual-multi" })
--[[ package({
  "sindrets/diffview.nvim",
  config = conf.diffview,
  dependencies = { "nvim-lua/plenary.nvim" },
}) ]]
package({
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = conf.gitsigns,
})
package({ "folke/trouble.nvim", config = conf.trouble })
-- leetcode
package({ "ianding1/leetcode.vim", config = conf.leetcode })
-- todo
package({
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = conf.todo,
})
package({
  "folke/flash.nvim",
  event = "VeryLazy",
  config = conf.flash,
})
-- session
package({
  "folke/persistence.nvim",
  event = { "BufReadPre" },
  config = conf.persistence,
})

package({
  "caenrique/swap-buffers.nvim",
  config = function()
    require("swap-buffers").setup()
  end,
})

-- test
package({
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
    "rouge8/neotest-rust",
  },
  config = conf.neotest,
})
