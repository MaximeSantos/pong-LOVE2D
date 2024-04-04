GameState = {
   is_started
}

-- Helper functions
function GameState:checkStartOfGame()
   if not self.is_started then
      if Player:checkPlayerInput() then
         self.is_started = true
         Ball:startMoving(-1)
      end
   end
end

function GameState:setIsStarted(boolean)
   self.is_started = boolean
end

-- Core functions
function GameState:load()
   self.is_started = false
end

function GameState:update(dt)
end

function GameState:draw()
   love.graphics.printf(
      tostring(self.is_started),
      0,
      (love.graphics.getHeight() / 2) - (FONT_SIZE * 4),
      love.graphics.getWidth(),
      "center"
   )
end
