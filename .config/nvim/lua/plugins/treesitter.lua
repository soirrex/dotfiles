return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  -- The `main` branch does not support lazy-loading: its `plugin/` scripts
  -- (filetype registrations, predicates) must be loaded at startup.
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')
    local parsers = require('nvim-treesitter.parsers')

    local function enable(bufnr, lang)
      if pcall(vim.treesitter.start, bufnr, lang) then
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('nvim-treesitter-config', { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end

        -- Parser is already installed: just enable highlighting and indentation.
        if vim.treesitter.language.add(lang) then
          enable(args.buf, lang)
          return
        end

        -- Parser is missing: install it on demand (the `main` branch has no
        -- `auto_install` option), then enable the features for this buffer.
        if not (parsers[lang] and parsers[lang].install_info) then
          return
        end

        ts.install({ lang }):await(function(err)
          if err then
            return
          end
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(args.buf) then
              enable(args.buf, lang)
            end
          end)
        end)
      end,
    })
  end,
}
