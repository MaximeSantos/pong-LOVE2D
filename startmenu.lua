StartMenu = {
}

local w_height = love.graphics.getHeight()
local w_width = love.graphics.getWidth()

local title_font
local normal_font

-- Helper functions
function StartMenu:drawTitle() -- Draws the title and subtitle
   local title_y_pos = TITLE_FONT_SIZE / 2
   local subtitle_y_pos = title_y_pos + TITLE_FONT_SIZE + FONT_SIZE / 2

   love.graphics.setFont(title_font)
   love.graphics.printf("PONG", 0, title_y_pos, w_width, "center")

   love.graphics.setFont(normal_font)
   love.graphics.printf("A game made in lua with the LOVE2D engine", 0, subtitle_y_pos, w_width, "center")
end

function StartMenu:pressEnterToStart() -- Draws the prompt to start the game
   -- love.graphics.setFont(title_font)
   love.graphics.printf("Press Enter to select", 0, w_height / 2, w_width, "center")
end

function StartMenu:actions() -- For now only starts the game // will allow selection of start menu entries with the Enter key
   if love.keyboard.isDown("return") then
      GameState.is_start_menu = false
   end
end

function StartMenu:drawSelectOptions()
   -- print(normal_font:getWidth("prout")) Gets the width of the text
   local select_options_vect = { x = w_width / 2 - FONT_SIZE * 3, y = w_height / 2 + FONT_SIZE * 2 }
   local line_height = FONT_SIZE * 2

   love.graphics.printf(self.select_options[1], select_options_vect.x, select_options_vect.y, w_width)
   love.graphics.printf(self.select_options[2], select_options_vect.x, select_options_vect.y + line_height, w_width)
   love.graphics.printf(self.select_options[3], select_options_vect.x, select_options_vect.y + line_height * 2,
      w_width)
end

-- Core functions
function StartMenu:load()
   title_font = love.graphics.newFont("assets/fonts/slkscr.ttf", TITLE_FONT_SIZE)
   normal_font = love.graphics.newFont("assets/fonts/slkscr.ttf", FONT_SIZE)

   --  Sets the different select options to display on the start menu
   self.select_options = {
      "1 player",
      "2 players",
      "settings"
   }
   -- The index of the currently selected option on the start menu
   self.selected = 1
end

function StartMenu:update(dt)
   StartMenu:actions()
end

function StartMenu:draw()
   StartMenu:drawTitle()
   StartMenu:pressEnterToStart()
   StartMenu:drawSelectOptions()
end
