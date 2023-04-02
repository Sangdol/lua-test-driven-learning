local stack = {}

function stack:new(size)
    local obj = {}
    obj.items = {}
    obj.size = size or math.huge
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function stack:push(item)
    if #self.items >= self.size then
        table.remove(self.items, 1)
    end
    table.insert(self.items, item)
end

function stack:pop()
    return table.remove(self.items)
end

function stack:peek()
    return self.items[#self.items]
end

function stack:is_empty()
    return #self.items == 0
end

return stack
