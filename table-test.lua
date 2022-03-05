--
-- Lua tables tests
--

lu = require('luaunit')

function testBasic()
  local table = {["a"] = 1, ["b"] = 2}
  lu.assertTrue(table["a"] == 1)
  lu.assertTrue(table["b"] == 2)

  local table2 = {a = 1, b = 2}
  lu.assertTrue(table['a'] == 1)
  lu.assertTrue(table['b'] == 2)
  lu.assertTrue(table.a == 1)
  lu.assertTrue(#table == 0)

  local list = {'a', 'b', 'c'}
  lu.assertTrue(list[1] == 'a')
  lu.assertTrue(#list == 3)

  local mixed = {a = 1, 'b', 'c'}
  lu.assertTrue(mixed[1] == 'b')
  lu.assertTrue(#mixed == 2)
end

function testIpairs()
  local sum = 0
  local concat = ''
  for i, word in ipairs({'a', 'b', 'c'}) do
    sum = sum + i
    concat = concat .. word
  end

  lu.assertTrue(sum == 6)
  lu.assertTrue(concat == 'abc')

  local sum2 = 0
  local concat2 = ''
  -- it stops at nil
  -- need to iterate using index and length (#table) to avoid it
  for i, word in ipairs({'a', 'b', nil, 'c'}) do
    sum2 = sum2 + i
    concat2 = concat2 .. word
  end

  lu.assertTrue(sum2 == 3)
  lu.assertTrue(concat2 == 'ab')
end

function testPairs()
  local sum = 0
  local chars = {}
  -- the order is not guaranteed
  for key, value in pairs({a = 1, b = 2, c = 3}) do
    sum = sum + value
    table.insert(chars, key)
  end

  table.sort(chars)

  lu.assertTrue(sum == 6)
  lu.assertEquals(chars, {'a', 'b', 'c'})
end

function testOrganizingFunctions()
  local funcs = {
    add = function(a, b) return a + b end,
    substract = function(a, b) return a - b end
  }

  lu.assertTrue(funcs.add(1, 2) == 3)
  lu.assertTrue(funcs.substract(1, 2) == -1)

  function withClosure(n)
    local function add(a)
      return n + a
    end

    local function subtract(a)
      return n - a
    end

    return {add = add, subtract = subtract}
  end

  local w = withClosure(10)
  lu.assertTrue(w.add(1) == 11)
  lu.assertTrue(w.subtract(1) == 9)
end

--
-- http://lua-users.org/wiki/TableLibraryTutorial
-- https://www.tutorialspoint.com/lua/lua_tables.htm
--
-- maxn is deprecated
-- https://stackoverflow.com/questions/49788068/getting-attempt-to-call-a-nil-value-field-maxn-error
--
function testTableFunctions()
  local t = {}
  table.insert(t, 'a')

  lu.assertEquals(t, {'a'})

  local c = table.remove(t)

  lu.assertTrue(c == 'a')
  lu.assertEquals(t, {})

  local concat = table.concat({'a', 'b'}, ', ')
  lu.assertTrue(concat == 'a, b')

  local t2 = {'a', 'c', 'b'}
  table.sort(t2)
  lu.assertEquals(t2, {'a', 'b', 'c'})

  table.sort(t2, function(a, b) return a > b end)
  lu.assertEquals(t2, {'c', 'b', 'a'})
end

os.exit( lu.LuaUnit.run() )
