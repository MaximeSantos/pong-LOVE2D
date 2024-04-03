Player = {
   x = 100,
   y = 100,
   velocity = 0
}

function Player.load()
end

function Player.update(dt)
end

function Player.draw()
   love.graphics.setColor(1, 0, 0)
   love.graphics.rectangle("fill", self.x, self.y, 10, 100)
end
