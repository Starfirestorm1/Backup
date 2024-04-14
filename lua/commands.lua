-- [[ Creates new tab and opens terminal]] 
root = os.getenv("ROOT")
vim.api.nvim_create_user_command('TabNewTerm',
    function()
       vim.cmd.tabnew()
       vim.cmd.term()
    end,
    {nargs = 0})
-- [[ Opens plugins list file ~/.config/nvim/lua/plug.lua ]]
vim.api.nvim_create_user_command('OpenUserPlug', 
    function()
        path = string.format("%s/.config/nvim/lua/%s", root, "plug.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
-- [[ Opens key map list file ~/.config/nvim/lua/keys.lua ]]
vim.api.nvim_create_user_command('OpenUserKeys', 
    function()
        path = string.format("%s/.config/nvim/lua/%s", root, "keys.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
-- [[ Opens functions list file ~/.config/nvim/lua/commands.lua ]]
vim.api.nvim_create_user_command('OpenUserCommands', 
    function()
        path = string.format("%s/.config/nvim/lua/%s", root, "commands.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
-- [[ Opens options list file ~/.config/nvim/lua/opts.lua ]]
vim.api.nvim_create_user_command('OpenUserOpts', 
    function()
        path = string.format("%s/.config/nvim/lua/%s", root, "opts.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
-- [[ Opens plugSetts list file ~/.config/nvim/lua/plugSettsj.lua ]]
vim.api.nvim_create_user_command('OpenUserPlugSetts', 
    function()
        path = string.format("%s/.config/nvim/lua/%s", root, "plugSetts.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
-- [[ Opens variables list file ~/.config/nvim/lua/vars.lua ]]
vim.api.nvim_create_user_command('OpenUserVars', 
    function()
        path = string.format("%s/.config/nvim/lua/%s", root, "vars.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
-- [[ Opens config file for cpp type ~/.config/nvim/ftplugin/cpp.lua ]]
vim.api.nvim_create_user_command('OpenUserConfigCpp', 
    function()
        path = string.format("%s/.config/nvim/ftplugin/%s", root, "cpp.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
-- [[ Opens config file for lua type ~/.config/nvim/ftplugin/lua.lua ]]
vim.api.nvim_create_user_command('OpenUserConfigLua', 
    function()
        path = string.format("%s/.config/nvim/ftplugin/%s", root, "lua.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
-- [[ Opens config file for java type ~/.config/nvim/ftplugin/java.lua ]]
vim.api.nvim_create_user_command('OpenUserConfigJava', 
    function()
        path = string.format("%s/.config/nvim/ftplugin/%s", root, "java.lua")
        vim.cmd(':e '..path)
    end,
    {nargs = 0}
)
vim.api.nvim_create_user_command('CreateProject',
    function(opts)
        ---------
       local path = require('neo-tree.sources.manager').get_state('filesystem').tree:get_node().path
       --------------
       if not opts.args or string.len(opts.args) < 1 
            then print("no arguments provided")
            return
       end
       -------------
       local root = os.getenv("ROOT")
       -------------
       local pargs = vim.split(opts.args, " ")
       local name = pargs[1]
       local package_name = string.lower(name)
       local class_name = string.upper(string.sub(name, 1, 1))..string.sub(name, 2, string.len(name))
       local dir_path = path.."/"..name
       --------
       local util = require("lib/utils") 
       local content_of_file = util.lines_from(root.."/.config/nvim/resources/App.java")
       local prepared_content = string.gsub(content_of_file, "{package_name}", package_name)
       prepared_content = string.gsub(prepared_content, "{class_name}", class_name)
       t = require("lib/transactions")
       --t.ActionCreation:BuildTree(root.."/dev/projects/hey/test")
       t:Start()
       t:CreateDirectory(root.."/dev/projects/hey/test")
       
       --q=require(root.."/.config/nvim/lua/lib/transactions")
       --q.queue.add("first")
       --print(q.queue.get())
       --dofile(root.."/.config/nvim/lua/lib/transactions.lua")
       --local t = require("lib/transactions")
       --print(t.ActionCreation:CheckIfExist('/home/sky/dev/'))
       -----------
       --os.execute(
        --"mkdir "..dir_path..";"..
        --"touch "..file_name..";"..
        --"echo "..content ..">>"..file_name
        --)
      ----------- 
       require("neo-tree.sources.manager").refresh("filesystem")
    end,
    {nargs = '*'}
)
vim.api.nvim_create_user_command("ReloadPackages", 
    function(opts)
        r = require("reload")
        r.ReloadPackages(opts.args)
    end,
    {nargs = 1}
)
