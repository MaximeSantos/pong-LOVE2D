Ball = {
   x,
   y,
   dx,
   dy,
   width,
   height,
   speed
}

-- Helper functions
function Ball:move(dt)
   self.x = self.x + (self.speed * (self.dx * dt))
   self.y = self.y + (self.speed * (self.dy * dt))
end

function Ball:collide() --
   -- Checks for Player collision
   if checkCollisions(self, Player) then
      Ball:bouncePlayer(Player)
   end

   -- Checks for wall collision
   Ball:bounceWalls()

   -- Check for goal collision
   -- TODO Score goals when the ball hits either end of the board
end

-- TODO Improve handling of the bounce by including Player velocity (not yet implemented)
function Ball:bouncePlayer(Player) -- Bouces the ball off the player paddle
   self.dx = -self.dx
   if self.dy == 0 then
      local collision = (self.y + self.height / 2) - (Player.y + Player.height / 2)
      if collision > 0 then
         self.dy = 1
      elseif collision < 0 then
         self.dy = -1
      end
   end
end

function Ball:bounceWalls() -- Checks if the ball is hitting the borders and reverses its vertical velocity if that's the case
   if self.y + self.height > love.graphics.getHeight() then
      self.dy = -self.dy
   elseif self.y < 0 then
      self.dy = -self.dy
   end
end

function Ball:startMoving(dx)
   self.dx = dx
end

-- Core functions
function Ball:load()
   -- Set default ball values
   self.width = 10
   self.height = 10
   self.x = love.graphics.getWidth() / 2 - self.width / 2
   self.y = love.graphics.getHeight() / 2 - self.height / 2
   self.dx = 0
   self.dy = 0
   self.speed = 300
end

function Ball:update(dt)
   if GameState.is_started then
      Ball:move(dt)
      -- Ball:checkBoundaries(dt)
      Ball:collide()
   end
end

function Ball:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
