Player = {
   x,
   y,
   width,
   height,
   speed
}

-- Helper functions
function Player:move(dt)
   if love.keyboard.isDown("w") or love.keyboard.isDown("z") then
      self.y = self.y - self.speed * dt
   elseif love.keyboard.isDown("s") then
      self.y = self.y + self.speed * dt
   end
end

function Player:checkBoundaries()
   if self.y < 0 then
      self.y = 0
   elseif self.y + self.height > WINDOW_HEIGHT then
      self.y = WINDOW_HEIGHT - self.height
   end
end

-- Core functions
function Player:load()
   self.width = 20
   self.height = 100
   self.x = 50
   self.y = (WINDOW_HEIGHT) / 2 - (self.height / 2)
   self.speed = 500
end

function Player:update(dt)
   Player:move(dt)
   Player:checkBoundaries(dt)
end

function Player:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
