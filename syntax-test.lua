--
-- Lua syntax tests
--

local lu = require('luaunit')

function testVariables()
  local a, b = 1, 2
  lu.assertTrue(a == 1 and b == 2)
end

function testIf()
  -- a is undefined
  if (a == nil) then
    lu.success()
  elseif (a == 1) then
    lu.fail()
  else
    lu.fail()
  end
end

function testComparison()
  lu.assertTrue(1 ~= 2)
  lu.assertTrue('a' < 'b')
  lu.assertTrue(c == nil) -- undefined

  -- Only `false` and `nil` are false values
  lu.assertTrue(not false)
  lu.assertTrue(not nil)
end

function localOperators()
  lu.assertTrue(4 and 5 == 5)
  lu.assertTrue(nil and 5 == nil)
  lu.assertTrue(false and 5 == false)

  lu.assertTrue(4 or 5 == 4)
  lu.assertTrue(nil or 5 == 5)

  lu.assertTrue(not 0 == false)
  lu.assertTrue(not 4 == false)
end

function testString()
  -- length
  lu.assertTrue(#'1' == 1)
  lu.assertTrue(#'12' == 2)

  -- concatenation
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
