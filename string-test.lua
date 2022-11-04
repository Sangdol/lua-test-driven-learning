lu = require('luaunit')

function testSplit()
  -- https://stackoverflow.com/a/7615129/524588
  function mysplit (inputstr, sep)
    if sep == nil then
      sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
    end
    return t
  end

  local str = "a,b,c"
  local t = mysplit(str, ",")
  lu.assertTrue(t[1] == 'a')
  lu.assertTrue(t[2] == 'b')
  lu.assertTrue(t[3] == 'c')
end

os.exit( lu.LuaUnit.run() )
