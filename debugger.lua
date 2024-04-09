Debugger = {
}

-- Helper functions

--- Appends a new message to the debugger
--- @param s string
function Debugger:append(s)
   self.msg = self.msg .. " " .. s
end

--- Appends a new message to the debugger then clear it after some time
--- @param s string
--- @param time integer?
function Debugger:appendThenClear(s, time)
   self.msg = self.msg .. " " .. s
   self.time_to_wait = time or self.time_to_wait
   self.is_timer_on = true
end

--- Clears the stored message
function Debugger:clear()
   self.msg = ""
end

--- Reset the Debugger to its default values
function Debugger:reset()
   self.msg = ""
   self.is_timer_on = false
   self.time_to_wait = 3
   self.passed_dt = 0
end

-- Core functions

function Debugger:load()
   self:reset()
end

function Debugger:update(dt)
   if self.is_timer_on then
      self.passed_dt = self.passed_dt + dt
      if self.passed_dt > self.time_to_wait then
         self:reset()
      end
   end
end

function Debugger:draw()
   love.graphics.printf(self.msg, 0, (love.graphics.getHeight() - FONT_SIZE), love.graphics.getWidth(), "center")
end
