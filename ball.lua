Ball = {
   width = 10,
   height = 10,
   speed = 500

}

-- Helper functions

--- Checks for collisions between two objects with x, y, width and height properties
function Ball:checkEntitiesCollisions(a, b)
   return a.x < b.x + b.width and a.x + a.width > b.x and a.y < b.y + b.height and a.y + a.height > b.y
end

function Ball:move(dt)
   self.x = self.x + (self.speed * (self.dx * dt))
   self.y = self.y + (self.speed * (self.dy * dt))
end

--- Logic that handles the different ball collisions (left/right paddles, top/bottom walls and left/right goals)
function Ball:collide(player_1, player_2)
   -- Checks for Player collision
   if Ball:checkEntitiesCollisions(self, player_1) then
      Ball:bouncePaddle(player_1)
   elseif Ball:checkEntitiesCollisions(self, player_2) then
      Ball:bouncePaddle(player_2)
   end

   -- Checks for Ai collision
   if Ball:checkEntitiesCollisions(self, Ai) then
      Ball:bouncePaddle(Ai)
   end

   -- Checks for wall collision
   Ball:bounceWalls()

   -- Check for goal collision
   local goal = Ball:checkGoal()
   if goal == "left" or goal == "right" then
      GameState:scoreGoal(goal, player_1, player_2)
   end
end

function Ball:handleBallSpeed() -- Increments the number of hits and increase the ball speed if there have been 3 consecutive hits
   self.hits = self.hits + 1
   if self.hits > 2 then
      self.speed = self.speed + 100
      self.hits = 0
   end
end

-- TODO the bounce angle of the ball should probably be determined by the paddle velocity ?
-- eg: if the paddle is not moving and it hits around the center, the ball should probably fly straight
-- Whereas hitting the ball with a moving paddle should probably alway make the ball bounce at an angle
function Ball:handleBounceAngle(Paddle) -- Handles the angle to give to the ball if it was going straight
   if self.dy == 0 then
      local collision = (self.y + self.height / 2) -
          (Paddle.y + Paddle.height / 2) -- center of the ball on y axis - center of paddle on y axis
      if collision > 0 then
         self.dy = 1
      elseif collision < 0 then
         self.dy = -1
      end
   end
end

function Ball:bouncePaddle(Paddle) -- Bouces the ball off the paddle - give it an object with y and height properties
   Ball:handleBallSpeed()

   if self.x < love.graphics.getWidth() / 2 then -- Places the ball outside of the paddle
      self.x = Paddle.x + Paddle.width
   else
      self.x = Paddle.x - Paddle.width
   end

   self.dx = -self.dx -- Reverses the direction of the ball
   Ball:handleBounceAngle(Paddle)
end

function Ball:bounceWalls() -- Checks if the ball is hitting the borders and repositions the ball and reverses its vertical velocity if it is hitting a wall
   local w_height = love.graphics.getHeight()

   if self.y + self.height > w_height then -- checks bottom wall
      self.y = w_height - self.height
      self.dy = -self.dy
   elseif self.y < 0 then -- check top wall
      self.y = 0
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
   local rand = love.math.random()
   if rand == 0 then
      self.dy = -1
   else
      self.dy = 1
   end
end

function Ball:reset() -- Set default ball values
   self.x = love.graphics.getWidth() / 2 - self.width / 2
   self.y = love.math.random(0, love.graphics.getHeight() - self.height)
   self.dx = 0
   self.dy = 0
   self.hits = 0
end

-- Core functions
function Ball:load()
   -- Set default ball values
   Ball:reset()
end

function Ball:update(dt, player_1, player_2)
   Ball:move(dt)
   Ball:collide(player_1, player_2)
end

function Ball:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
