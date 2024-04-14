
root=vim.fs.find({'gradlew', '.gitignore'}, { upward = true, limit = 1, path=vim.fs.dirname(vim.api.nvim_buf_get_name(0))})
usr_home=os.getenv("ROOT")
print(root[1])
print(root)
for k, v in pairs(root) do
    print(k, v)
end
vim.lsp.start({
  name = 'jdtls',
  cmd = {

    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar', usr_home..'dev/servers/eclipse/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.700.v20231129-1311.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', usr_home..'dev/servers/eclipse/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', '"' .. root[1] .. '"'
  },
  root_dir = root[1],
})


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    print(vim.inspect(ev))
    vim.bo[ev.buf].formatexpr = nil
    vim.bo[ev.buf].omnifunc = nil
    --vim.keymap.del("n", "K", { buffer = ev.buf })
    print("Lsp attached");
  end,
})
