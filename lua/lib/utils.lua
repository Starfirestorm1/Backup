--hhtp//lua-users.org/wiki/FileInputOutput
--
local utils = {}
--see if the file exists

function utils.file_exists(file)
local f=io.open(file, "rb")
if f then f:close() end
return f ~=nil
end
--get all lines fron the file, returns an empty
--list/table if the file doesnt exists
function utils.lines_from(file)
    if not utils.file_exists(file) then return {} end
    local concatenatedString = "" 
   for line in io.lines(file) do
       concatenatedString=concatenatedString..line.."/n"
   end
   return concatenatedString 
end

return utils
   
    
