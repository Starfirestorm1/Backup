require("lspconfig").clangd.setup{
--  name = 'clangd',
  cmd = {
    'clangd',
    --'--compile-commands-dir=/home/aimd/dev/projects/cpp/base/'
  },
  root_dir = require("lspconfig").util.root_pattern('main.cpp')
}


--vim.api.nvim_create_autocmd('LspAttach', {
--  callback = function(ev)
    --print(vim.inspect(ev))
    --vim.bo[ev.buf].formatexpr = nil
    --vim.bo[ev.buf].omnifunc = nil
    --vim.keymap.del("n", "K", { buffer = ev.buf })
--    print("Lsp attached");
--  end,
--})
