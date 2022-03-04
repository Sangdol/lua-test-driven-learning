```sh
# Install Lua rocks
brew install luarocks
luarocks install luaunit

# Set environment variables for Lua to load modules
# https://github.com/luarocks/luarocks/wiki/Using-LuaRocks
eval "$(luarocks path --bin)"

# Run a test
lua syntax-test.lua
```

 [🔨🥄](https://github.com/Sangdol/hammerspoon-config)
