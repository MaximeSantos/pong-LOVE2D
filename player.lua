Player = {
   x,
   y,
   width,
   height,
   speed
}

-- Helper functions
function Player:move(dt) -- Checks for player input and set player position accordingly
   if love.keyboard.isDown("w") or love.keyboard.isDown("z") then
      self.y = self.y - self.speed * dt
   elseif love.keyboard.isDown("s") then
      self.y = self.y + self.speed * dt
   end
end

function Player:checkBoundaries() -- Checks if the player encounters a wall and sets its position accordingly
   local w_height = love.graphics.getHeight()
   if self.y < 0 then
      self.y = 0
   elseif self.y + self.height > w_height then
      self.y = w_height - self.height
   end
end

function Player:checkPlayerInput() -- Checks for player 1 input
   if love.keyboard.isDown("w") or love.keyboard.isDown("z") or love.keyboard.isDown("s") then
      return true
   end
   return false
end

function Player:reset() -- Set default player values
   self.width = 20
   self.height = 100
   self.x = 50
   self.y = (love.graphics.getHeight()) / 2 - (self.height / 2)
   self.speed = 500
end

-- Core functions
function Player:load()
   -- Set default player values
   Player:reset()
end

function Player:update(dt)
   Player:move(dt)
   Player:checkBoundaries(dt)
end

function Player:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
