Ui = {}

local w_height = love.graphics.getHeight()
local w_width = love.graphics.getWidth()
local score_font

-- Helper functions
function Ui:drawPressToStart() -- Draws "Press UP/DOWN to start" when the game hasn't started yet
   -- Draw some text in the center of the screen
   if not GameState.is_started then
      love.graphics.setColor(1, 1, 1)
      love.graphics.printf("Press UP/DOWN to start", 0, (w_height / 2) - (FONT_SIZE * 2), w_width, "center")
   end
end

function Ui:drawScores()
   love.graphics.setFont(score_font)
   local centerSpace = w_width / 8
   -- Draws score of left player
   love.graphics.printf(tostring(GameState.score_left), -centerSpace, w_height / 8, w_width, "center")
   -- Draws score of right player
   love.graphics.printf(tostring(GameState.score_right), centerSpace, w_height / 8, w_width, "center")
end

-- Core functions
function Ui:load()
   score_font = love.graphics.newFont("assets/ToreksRegular.ttf", 100)
end

function Ui:update(dt)
end

function Ui:draw()
   Ui:drawPressToStart(GameState.is_started)
   Ui:drawScores()
end
