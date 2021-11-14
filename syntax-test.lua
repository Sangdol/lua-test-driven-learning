lu = require('luaunit')

function testVariables()
  local a, b = 1, 2
  lu.assertTrue(a == 1 and b == 2)
end

function testIf()
  if (a == nil) then
    lu.success()
  elseif (a == 1) then
    lu.fail()
  else
    lu.fail()
  end
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

function testClosure()
  function adder(v)
    function closure(x) return x+v end
    return closure
  end

  local f = adder(3)
  lu.assertTrue(f(2) == 5)
end

function testFunction()
  lu.assertTrue((function(a, b) return a+b end)(1, 2) == 3)

  local add = function(a, b) return a+b end
  lu.assertTrue(add(2, 3) == 5)
end

function testComparison()
  lu.assertTrue(1 ~= 2)
  lu.assertTrue('a' < 'b')
  lu.assertTrue(c == nil)

  -- Only false and nil are false values
  lu.assertTrue(not false)
  lu.assertTrue(not nil)
end

function testString()
  -- length
  lu.assertTrue(#'1' == 1)
  lu.assertTrue(#'12' == 2)

  local concat1 = '123' .. 'abc'
  lu.assertTrue(concat1 == '123abc')

  local concat2 = 123 .. 456
  lu.assertTrue(concat2 == '123456')

  local concat3 = 123 .. '456'
  lu.assertTrue(concat3 == '123456')
end

function testLoop()
  local sum = 0
  for i = 1, 10 do
    sum = sum + i
  end
  lu.assertTrue(sum == 55)

  -- for variable = start number, end number, step do
  local sum2 = 0
  for i = 10, 1, -1 do
    sum2 = sum2 + i
  end
  lu.assertTrue(sum2 == 55)
end

os.exit( lu.LuaUnit.run() )
