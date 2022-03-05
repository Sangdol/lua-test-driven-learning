--
-- Lua `require` tests
--

lu = require('luaunit')

require('modules.simple')

function testSimple()
  lu.assertTrue(add(1, 2) == 3)
  lu.assertTrue(subtract(1, 2) == -1)

  -- local function
  lu.assertTrue(localAdd == nil)
end

m = require('modules.namespaced')

function testNamespaced()
  lu.assertTrue(m.add(1, 2) == 3)
  lu.assertTrue(m.subtract(1, 2) == -1)
end

os.exit( lu.LuaUnit.run() )
