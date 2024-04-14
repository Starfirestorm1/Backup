Node = {} 
function Node:New(o, _value)    
    o = o or {} 
    setmetatable(o, self) 
    self.__index = self 
    self.value = _value or 0 
    self.after = nil 
    return o 
end 
Queue = {}
function Queue:New(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.first=nil
    self.last=nil
    return o

end

function Queue:Add(_value)
    local n = Node:New{value=_value}
    if(self.first == nil) then
        self.first = n
        self.last = self.first
    else
        self.last.after = n
        self.last = self.last.after
    end
end
function Queue:Get()
    local result 
    if(self.first == nil) then
        result = -1
    else 
        result = self.first.value
        self.first = self.first.after
    end
    return result
end
Action={}
function Action:New(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
function Action:Sprit(input_str, delimiter)
    if(delimiter == nil) then
        delimiter = "%s"
    end
    local t = {}
    for str in string.gmatch(input_str, "([^"..delimiter.."]+)") do
        table.insert(t, str)
    end
    return t
end
function Action:Exists(path)

    local ok, err, code = os.rename(path, path)
    if not ok then 
        if code == 13 then
            return true
        end
    end
    return ok
end
ActionInit = Action:New(nil)
function ActionInit:New(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.Tree = Tree:New{}
    return o
end
function ActionInit:BuildTree(path)
    local s = self:Sprit(path, "/")
    local part_path = ""
    local id = 0
    local is_existed = false
    --local previous_path=""
    --local existed_path=""
    --local not_existed_path=""
    for _, v in pairs(s) do
        --previous_path=part_path
        part_path = part_path.."/"..v
        --print(part_path)
        if (self:Exists(part_path) == true) then 
            is_existed = true
            --existed_path=previous_path
            --not_existed_path=part_path
            --print(Tree.root.value.." "..#self.Tree.root.branches)
        else
            is_existed = false
            --break
        end
        id=id+1
        self.Tree:Insert(v, id, is_existed)
        self.Tree:MoveToLastInserted()

    end
    self.Tree:Print()

    
    --print(existed_path.." "..not_existed_path)
end
function ActionInit:TreeGetRollBackPoint()
    local current = self.Tree.root
    local pathRollBack = ""
    
end
ActionDirectory = {}
ActionDirectory = Action:New(nil)
function ActionDirectory:New(o, path)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.path = path
    self.ActionInit = ActionInit:New{}
    self.ActionInit:BuildTree(path)
    return o
end
function ActionDirectory:Run(path)
    os.execute(
    "mkdir -p "..path
    )
end
function ActionDirectory:RollBack(tree)
    os.execute("rm -rf "..self.ActionInit.pathRollBack)
end
Transaction = {}
function Transaction:New(o)
    o = o or {}
    setmetatable(o, self)
    self.__index=self
    self.Queue = Queue:New(nil)
    self.ActionInit = ActionInit:New(nil)
    self.actions = nil
    return o
end
function Transaction:Start()
end
function Transaction:AddAction(action)
    if(self.actions == nil) then 
        self.actions = {}
    end
    self.actions[#self.actions+1]=action
end
function Transaction:CreateDirectory(path)
    self:AddAction(ActionDirectory:New{path=path})
end
Branche = {}
function Branche:New(o, value)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.path = nil
    self.id = nil
    self.parent = nil
    self.value = value or nil
    self.branches = nil
    self.is_existed = nil
    return o
end
function Branche:Insert(branche)
    if(self.branches == nil) then
        self.branches = {}
    end
    self.branches[#self.branches+1] = branche
    --print(self.branches[1].value.." id=:"..self.branches[1].id)
end
function Branche:GetValue()
    return self.value
end
Tree={}
function Tree:New(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.current = nil
    self.root = nil
    return o
end
function Tree:Insert(value, path, id, is_existed)
    new_branche = Branche:New{value=value, path = path, id = id, is_existed = is_existed}
    if(self.root == nil) then
        self.root = new_branche
        self.current = self.root
        --print("root=nil".." "..self.root.value .. " " .. #self.root.branches)
        id=id+1
    else 
        new_branche.parent = self.current
        self.current:Insert(new_branche)
    end
    --print(#self.root.branches)
end
function Tree:MoveTo(branche)
    self.current = branche
end
function Tree:MoveToRoot()
    self.current = self.root
end
function Tree:MoveToLastInserted()
    if(self.current.branches == nil) then
        return
    else
        self.current = self.current.branches[#self.current.branches]
    end
        
end
function Tree:Print()
    local current = self.root
    local result_string = ""
    while current.branches ~= nil do
        current = current.branches[1]
        result_string=result_string.."/"..current.value.." "..current.id.." "..tostring(current.is_existed).." "
    end
    --print(self.root.branches[1].branches[1].value)
    print(result_string)

end

return Transaction:New{}
