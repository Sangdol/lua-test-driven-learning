Lua Test Driven Learning
===

Learn Lua by writing or reading tests.

Installation
---

This project uses [LuaUnit](https://github.com/bluebird75/luaunit) which is a unit testing framework for Lua.

[LuaRocks](https://luarocks.org/) is a package manager that you can install LuaUnit.

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

Project Structure
---

```lua
.
├── LICENSE
├── README.md
├── syntax-test.lua           -- Learning Lua syntax
├── function-test.lua         -- Learning Lua functions
├── error-handling-test.lua   -- Learning error handling with Lua
├── luaunit-test.lua          -- Learning LuaUnit
├── table-test.lua            -- Learning Lua table
├── module-test.lua           -- Learning Lua require
└── modules                   -- Modules that that are used in module-test.lua
    ├── namespaced.lua
    └── simple.lua
```

See also
---

* [Lua Getting Started](http://www.lua.org/start.html)
* [Learn X in Y minutes](https://learnxinyminutes.com/docs/lua/)
* [LuaUnit Documentation](https://luaunit.readthedocs.io/)
* [Getting started using Lua in Neovim](https://github.com/nanotee/nvim-lua-guide)
* [Hammerspoon](https://www.hammerspoon.org/)

License
---

MIT
