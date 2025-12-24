return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true

    vim.api.nvim_set_keymap(
      "i",
      "<A-Tab>",
      'copilot#Accept("<CR>")',
      { expr = true, silent = true }
    )
  end
}
