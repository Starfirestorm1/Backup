r = {}
function r:New(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
function r.ReloadPackages(name_to_reload)
    print(#package.loaded)
    for name,_ in pairs(package.loaded) do
        if name:match(name_to_reload) and not name:match("neotree") then
            package.loaded[name]=nil
        end
    end
    dofile(vim.env.MYVIMRC)
    vim.notify("Lua reloaded", vim.log.levels.INFO)
end
return r
