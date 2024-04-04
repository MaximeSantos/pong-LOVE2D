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

function Ball:checkBoundaries()
end

function Ball:startMoving(dx)
   self.dx = dx
end

-- Core functions
function Ball:load()
   -- Set default ball values
   self.width = 10
   self.height = 10
   self.x = (love.graphics.getWidth()) / 2 - (self.width / 2)
   self.y = (love.graphics.getHeight()) / 2 - (self.height / 2)
   self.dx = 0
   self.dy = 0
   self.direction = 270
   self.speed = 300
end

function Ball:update(dt)
   if GameState.is_started then
      Ball:move(dt)
      Ball:checkBoundaries(dt)
   end
end

function Ball:draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
