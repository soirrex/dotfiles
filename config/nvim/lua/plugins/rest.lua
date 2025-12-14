return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  keys = {
    { "<leader>rr", "<cmd>Rest run<CR>",      desc = "Run HTTP request" },
    { "<leader>rl", "<cmd>Rest run last<CR>", desc = "Run last request" },
    { "<leader>ro", "<cmd>Rest open<CR>",     desc = "Open result window" },
    { "<leader>rc", "<cmd>Rest open<CR>",     desc = "Open cookies" },
  },
}
