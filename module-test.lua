lu = require('luaunit')

require('modules.simple')

function testSimple()
  lu.assertTrue(add(1, 2) == 3)
  lu.assertTrue(subtract(1, 2) == -1)
end

m = require('modules.namespaced')

function testSimple()
  lu.assertTrue(m.add(1, 2) == 3)
  lu.assertTrue(m.subtract(1, 2) == -1)
end

os.exit( lu.LuaUnit.run() )
