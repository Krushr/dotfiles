local M = {}

M.signs =  { Error = " ", Warn = " ", Hint = " ", Info = " " }

function M.setup()
  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    severity_sort = true,
  })

  for type, icon in pairs(M.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.o.updatetime = 250
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
end

return M
