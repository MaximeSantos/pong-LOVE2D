Ui = {}

local w_height = love.graphics.getHeight()
local w_width = love.graphics.getWidth()
local score_font

-- Helper functions
function Ui:drawPressToStart() -- Draws "Press UP/DOWN to start" when the game hasn't started yet
   -- Draw some text in the very center of the screen
   if not GameState.is_started then
      love.graphics.setColor(1, 1, 1)
      love.graphics.printf("Press UP/DOWN to start", 0, w_height / 2 - FONT_SIZE / 2, w_width, "center")
   end
end

function Ui:drawScores()
   love.graphics.setFont(score_font)
   local center_margin = w_width / 8
   -- Draws score of left player
   love.graphics.printf(tostring(GameState.score_left), -center_margin, w_height / 10, w_width, "center")
   -- Draws score of right player
   love.graphics.printf(tostring(GameState.score_right), center_margin, w_height / 10, w_width, "center")
end

function Ui:drawMiddleDashedLine() -- Draws a vertical dashed line through the middle of the screen
   local center_x = w_width / 2
   local start_point = 0
   local end_point = w_height
   local dash_length = 10
   local dash_gap = 10

   for y = start_point, end_point, dash_length + dash_gap do
      if not GameState.is_started and y < w_height / 2 - FONT_SIZE * 2 or y > w_height / 2 + FONT_SIZE * 2 then
         love.graphics.line(center_x, y, center_x, y + dash_length)
      elseif GameState.is_started then
         love.graphics.line(center_x, y, center_x, y + dash_length)
      end
   end
end

-- Core functions
function Ui:load()
   score_font = love.graphics.newFont("assets/fonts/slkscr.ttf", TITLE_FONT_SIZE)
end

function Ui:update(dt)
end

function Ui:draw()
   Ui:drawPressToStart()
   Ui:drawScores()
   Ui:drawMiddleDashedLine()
end
