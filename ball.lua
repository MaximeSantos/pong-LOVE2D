Ball = {
   x,
   y,
   dx,
   dy,
   width,
   height,
   speed,
   hits
}

-- Helper functions
function Ball:move(dt)
   self.x = self.x + (self.speed * (self.dx * dt))
   self.y = self.y + (self.speed * (self.dy * dt))
end

function Ball:collide() -- Logic that handles the different ball collisions (left/right paddles, top/bottom walls and left/right goals)
   -- Checks for Player collision
   if checkCollisions(self, Player) then
      Ball:bouncePaddle(Player)
   end
   -- Checks for Ai collision -- TODO Improve because the ball probably goes deeper inside the paddle for the ai
   if checkCollisions(self, Ai) then
      Ball:bouncePaddle(Ai)
   end

   -- Checks for wall collision
   Ball:bounceWalls()

   -- Check for goal collision
   local goal = Ball:checkGoal()
   if goal == "left" or goal == "right" then
      GameState:scoreGoal(goal)
   end
end

function Ball:handleBallSpeed() -- Increments the number of hits and increase the ball speed if there have been 3 consecutive hits
   self.hits = self.hits + 1
   if self.hits >= 3 then
      self.speed = self.speed + 100
      self.hits = 0
   end
end

function Ball:handleBounceAngle(Paddle) -- Handles the angle to give to the ball if it was going straight
   if self.dy == 0 then
      local collision = (self.y + self.height / 2) - (Paddle.y + Paddle.height / 2)
      if collision > 0 then
         self.dy = 1
      elseif collision < 0 then
         self.dy = -1
      end
   end
end

-- TODO Improve handling of the bounce by including Player velocity (not yet implemented)
function Ball:bouncePaddle(Paddle) -- Bouces the ball off the paddle - give it an object with y and height properties
   Ball:handleBallSpeed()
   self.dx = -self.dx -- Reverses the direction of the ball
   Ball:handleBounceAngle(Paddle)
end

function Ball:bounceWalls() -- Checks if the ball is hitting the borders and reverses its vertical velocity if that's the case
   if self.y + self.height > love.graphics.getHeight() then
      self.dy = -self.dy
   elseif self.y < 0 then
      self.dy = -self.dy
   end
end

function Ball:checkGoal() -- Checks if the ball hits either goals (the left or right walls) and returns nil, "left" or "right"
   if Ball.x + Ball.width > love.graphics.getWidth() then
      return "right"
   elseif Ball.x < 0 then
      return "left"
   else
      return nil
   end
end

function Ball:startMoving(dx)
   self.dx = dx
end

function Ball:reset() -- Set default ball values
   self.width = 10
   self.height = 10
   self.x = love.graphics.getWidth() / 2 - self.width / 2
   self.y = love.graphics.getHeight() / 2 - self.height / 2
   self.dx = 0
   self.dy = 0
   self.speed = 300
   self.hits = 0
end

-- Core functions
function Ball:load()
   -- Set default ball values
   Ball:reset()
end

function Ball:update(dt)
   Ball:move(dt)
   Ball:collide()
end

function Ball:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
