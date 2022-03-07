--
-- Error Handling tests
-- https://www.lua.org/pil/8.4.html
--

lu = require('luaunit')

-- If you need to handle errors in Lua,
-- you should use the pcall function (protected call)
-- to encapsulate your code.
function testPcall()
  function add(a, b)
    return a + b
  end

  -- `status` is boolean (true or false).
  -- the second value is a result when `status` is true.
  local status, result = pcall(add, 1, 2)
  lu.assertTrue(status)
  lu.assertTrue(result == 3)
end

function testPcallErr()
  function errFunc()
    -- indexing a nil value
    return a[i]
  end

  local status, err = pcall(errFunc)

  -- `status` is boolean (true or false).
  -- the second value is an error message when `status` is false.
  lu.assertFalse(status)
  lu.assertTrue(err == "error-handling-test.lua:21: attempt to index a nil value (global 'a')")
end

function testPcallErrObject()
  -- Any value that is passed to `error` will be returned by pcall.
  function errFunc()
    error({code=121})
  end

  local status, err = pcall(errFunc)

  lu.assertFalse(status)
  lu.assertTrue(err.code == 121)
end

os.exit( lu.LuaUnit.run() )
