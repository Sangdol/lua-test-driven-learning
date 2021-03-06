--
-- Tests to test LuaUnit 
-- https://luaunit.readthedocs.io/en/latest/
--

lu = require 'luaunit'

function testBasic()
  local a = 1
  local b = 1

  lu.assertTrue(a == b)
  lu.assertFalse(a ~= b)

  local l1 = {1, 2, 3}
  local l2 = {1, 2, 3}

  lu.assertEquals(l1, l2)
end

function testSuccessFail()
  if (1 == 1) then
    lu.success()
  else
    lu.fail()
  end

  lu.successIf(1 == 1)
  lu.failIf(1 == 2)
end

os.exit( lu.LuaUnit.run() )
