Debugger = {
}

-- Helper functions
function Debugger:append(string)
   self.msg = self.msg .. " " .. string
end

function Debugger:clear()
   self.msg = ""
end

-- Core functions
function Debugger:load()
   self.msg = ""
end

function Debugger:update(dt)
end

function Debugger:draw()
   love.graphics.printf(self.msg, 0, (love.graphics.getHeight() - FONT_SIZE), love.graphics.getWidth(), "center")
end
