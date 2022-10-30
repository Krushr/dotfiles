local use = require('packer').use

--[[
" Completion sources
]]--
use {
  'hrsh7th/nvim-cmp',
  config = function()
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    -- Setup nvim-cmp.
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
        end,
      },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"]() == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help'},
      },
      formatting = {
        format = lspkind.cmp_format({with_text = true})
      }
    })
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
      })
    })
    cmp.setup.cmdline('/', {
      sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' },
        { name = 'buffer' }
      })
    })
  end
}


use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/cmp-nvim-lsp-document-symbol'
use 'hrsh7th/cmp-nvim-lsp-signature-help'
use 'hrsh7th/cmp-path'