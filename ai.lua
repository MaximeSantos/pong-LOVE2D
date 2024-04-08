Ai = {
   width = 20,
   height = 100,
   speed = 500,
   x = love.graphics.getWidth() - 50

}

-- Helper functions
function Ai:move(dt) -- The ai moves toward the y axis of the ball
   local ball_center = Ball.y + Ball.height / 2
   local ai_center = self.y + self.height / 2
   --  Compare ball y position to ai y position and change dy accordingly
   if ball_center > ai_center then
      self.y = self.y + self.speed * dt
   elseif ball_center < ai_center then
      self.y = self.y - self.speed * dt
   end
end

function Ai:checkBoundaries() -- Checks if the ai encounters a wall and sets its position accordingly
   local w_height = love.graphics.getHeight()
   if self.y < 0 then
      self.y = 0
   elseif self.y + self.height > w_height then
      self.y = w_height - self.height
   end
end

function Ai:reset() -- Set default ai values
   self.y = (love.graphics.getHeight()) / 2 - (self.height / 2)
end

-- Core functions
function Ai:load()
   -- Set default ai values
   Ai:reset()
end

function Ai:update(dt)
   Ai:move(dt)
   Ai:checkBoundaries()
end

function Ai:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
