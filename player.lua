Player = {
   id = 1, -- Must be 1 or 2
   width = 20,
   height = 100,
   speed = 500,
}

local paddle_margin = 50
local paddle_y_pos = (love.graphics.getHeight()) / 2 - (Player.height / 2)

--- Constructor
--- @param id integer
--- @param o table?
function Player:new(id, o)
   o = o or {} -- create object if user does not provide one

   o.id = id

   if o.id == 1 then
      o.x = paddle_margin
   elseif o.id == 2 then
      o.x = love.graphics.getWidth() - paddle_margin
   end
   o.y = paddle_y_pos

   setmetatable(o, self)
   self.__index = self
   return o
end

-- Helper functions
function Player:move(dt) -- Checks for player input and set player position accordingly
   if self.id == 1 then
      if love.keyboard.isDown("w") or love.keyboard.isDown("z") then
         self.y = self.y - self.speed * dt
      elseif love.keyboard.isDown("s") then
         self.y = self.y + self.speed * dt
      end
   elseif self.id == 2 then
      if love.keyboard.isDown("up") then
         self.y = self.y - self.speed * dt
      elseif love.keyboard.isDown("down") then
         self.y = self.y + self.speed * dt
      end
   end
end

--- Checks if the player encounters a wall and sets its position accordingly
function Player:checkBoundaries()
   local w_height = love.graphics.getHeight()
   if self.y < 0 then
      self.y = 0
   elseif self.y + self.height > w_height then
      self.y = w_height - self.height
   end
end

--- Checks for input from the serving player
function Player:checkPlayerInput()
   if love.keyboard.isDown("w") or love.keyboard.isDown("z") or love.keyboard.isDown("s") then
      return true
   end
   return false
end

--- Resets player values
function Player:reset()
   if self.id == 1 then
      self.x = paddle_margin
   elseif self.id == 2 then
      self.x = love.graphics.getWidth() - paddle_margin
   end
   self.y = paddle_y_pos
end

-- Core functions

function Player:load()
   -- self:reset()
end

function Player:update(dt)
   self:move(dt)
   self:checkBoundaries()
end

function Player:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
