--
-- Lua function tests
--
-- See table-test.lua to learn how to organize functions.
--

lu = require('luaunit')

function testFunction()
  lu.assertTrue((function(a, b) return a+b end)(1, 2) == 3)

  local add = function(a, b) return a+b end
  lu.assertTrue(add(2, 3) == 5)
end

function testClosure()
  function adder(v)
    function closure(x) return x+v end
    return closure
  end

  f = adder(3)
  lu.assertTrue(f(2) == 5)
end

-- no default function overloading
function testOverloading()
  -- this is not called.
  function adder()
    return 0
  end

  function adder(a, b)
    if (a == nil and b == nil) then
      return -1
    end

    return a + b
  end

  lu.assertTrue(adder() == -1)
  lu.assertTrue(adder(1, 2) == 3)
end

os.exit( lu.LuaUnit.run() )
