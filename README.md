Lua Test Driven Learning
===

Installation
---

This project uses [LuaUnit](https://github.com/bluebird75/luaunit) and [LuaRocks](https://luarocks.org/).

```sh
brew install luarocks
luarocks install luaunit
```

Running tests
---

Lua checks the environment variable `LUA_PATH` to determine the path to look for libraries when [the require function](https://www.lua.org/pil/8.1.html) is called.

The LuaRocks CLI tool provides [a way to set up LUA_PATH](https://github.com/luarocks/luarocks/wiki/Using-LuaRocks#rocks-trees-and-the-lua-libraries-path) so that Lua can use the libraries.

```sh
# Set environment variables for Lua to load libraries
eval "$(luarocks path --bin)"

# Run a test
lua syntax-test.lua
```

Or you can use the `test.sh` script:
```sh
# Run a test
./test.sh syntax-test.lua

# Run tests with all Lua files
./test.sh *lua
```

See also
---

* [Lua Getting Started](http://www.lua.org/start.html)
* [Learn X in Y minutes](https://learnxinyminutes.com/docs/lua/)
* [LuaUnit Documentation](https://luaunit.readthedocs.io/)
* [Getting started using Lua in Neovim](https://github.com/nanotee/nvim-lua-guide)

License
---

MIT
