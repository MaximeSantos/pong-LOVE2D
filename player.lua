Player = {
   id = 1,
   width = 20,
   height = 100,
   speed = 500,
}

-- Construction
function Player:new(o)
   self.x = 50
   self.y = (love.graphics.getHeight()) / 2 - (self.height / 2)

   o = o or {} -- create object if user does not provide one
   setmetatable(o, self)
   self.__index = self
   return o
end

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
   self.x = 50
   self.y = (love.graphics.getHeight()) / 2 - (self.height / 2)
end

-- Core functions
function Player:load()
   -- Set default player values
   self:reset()
end

function Player:update(dt)
   self:move(dt)
   self:checkBoundaries()
end

function Player:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
