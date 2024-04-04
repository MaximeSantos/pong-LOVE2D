Ui = {}

-- Helper functions
function Ui:drawPressToStart(is_started) -- Draws "Press UP/DOWN to start" when the game hasn't started yet
   -- Draw some text in the center of the screen
   if not is_started then
      love.graphics.setColor(1, 1, 1)
      love.graphics.printf(
         "Press UP/DOWN to start",
         0,
         (love.graphics.getHeight() / 2) - (FONT_SIZE * 2),
         love.graphics.getWidth(),
         "center"
      )
   end
end

-- Core functions
function Ui:load()
end

function Ui:update(dt)
end

function Ui:draw(is_started)
   Ui:drawPressToStart(is_started)
end
