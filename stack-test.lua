--
-- Test the stack module
--

lu = require('luaunit')
stack = require('modules/stack')

function testStack()
  local s = stack:new(3)
  s:push('a')
  s:push('b')
  s:push('c')
  s:push('d')
  lu.assertTrue(s:peek() == 'd')
  lu.assertTrue(s:pop() == 'd')
  lu.assertTrue(s:peek() == 'c')
  lu.assertTrue(s:pop() == 'c')
  lu.assertTrue(s:peek() == 'b')
  lu.assertTrue(s:pop() == 'b')
  lu.assertTrue(s:is_empty())
end

os.exit( lu.LuaUnit.run() )

