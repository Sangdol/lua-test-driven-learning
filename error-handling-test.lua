--[[
  https://www.lua.org/pil/8.4.html
]]--

lu = require('luaunit')

function testPcall()
  function add(a, b)
    return a + b
  end

  -- pcall returns true or false
  lu.assertTrue(pcall(add, 1, 2))
end

function testPcallErr()
  function err()
    return a[i]
  end

  local status, err = pcall(err)

  lu.assertFalse(status)
  lu.assertTrue(err == "error-handling-test.lua:18: attempt to index a nil value (global 'a')")
end

function testPcallErrObject()
  function err()
    error({code=121})
  end

  local status, err = pcall(err)

  lu.assertFalse(status)
  lu.assertTrue(err.code == 121)
end

os.exit( lu.LuaUnit.run() )
