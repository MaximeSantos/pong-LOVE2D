StartMenu = {
   select_options = { --  The different select options to display on the start menu
      "1 player",
      "2 players",
      "settings"
   },
   selected = 1 -- The index of the currently selected option on the start menu
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

--- Draws the prompt to start the game
function StartMenu:pressEnterToStart()
   -- love.graphics.setFont(title_font)
   love.graphics.printf("Press Enter to select", 0, w_height / 2, w_width, "center")
end

--- Check which option is selected (only 1 & 2 players for now -- TODO SETTING)
function StartMenu:select()
   if self.selected == 1 then
      GameState:setIsMultiplayer(false) -- Launches single player VS the AI
   elseif self.selected == 2 then
      GameState:setIsMultiplayer(true)  -- Launches local 2 player game
   elseif self.selected == 3 then
      Debugger:appendThenClear("Not implemented yet.")
      return
   end
   GameState:setIsStartMenu(false) -- Closes the start menu and starts the game
end

--- Selects the gamemode with up/down and launches with enter
function StartMenu:actions()
   function love.keypressed(_, scancode)
      if scancode == "return" or scancode == "space" then
         self:select()
      elseif scancode == "w" or scancode == "up" then
         if self.selected > 1 then
            self.selected = self.selected - 1
         else
            self.selected = #self.select_options
         end
      elseif scancode == "s" or scancode == "down" then
         if self.selected < #self.select_options then
            self.selected = self.selected + 1
         else
            self.selected = 1
         end
      end
   end
end

--- @param string string
--- @param pos_x integer
--- @param pos_y integer
function StartMenu:underline(string, pos_x, pos_y)
   local string_width = normal_font:getWidth(string)
   local end_line_x = pos_x + string_width

   love.graphics.setLineWidth(2)
   love.graphics.line(pos_x, pos_y + FONT_SIZE, end_line_x, pos_y + FONT_SIZE)
end

--- @param index integer
function StartMenu:checkIsSelected(index)
   return index == self.selected
end

-- TODO Replace underline with an arrow

function StartMenu:drawSelectOptions()
   local select_options_pos = { x = w_width / 2 - FONT_SIZE * 3, y = w_height / 2 }
   local line_height = FONT_SIZE * 2

   for i = 1, #self.select_options do -- Goes through our select options and print them
      local string_to_print = self.select_options[i]
      local pos_x = select_options_pos.x
      local pos_y = select_options_pos.y + line_height * i

      love.graphics.printf(string_to_print, pos_x, pos_y, w_width) -- Prints the select option

      if self:checkIsSelected(i) then                              -- Underlines current select option if it is selected
         self:underline(string_to_print, pos_x, pos_y)
      end
   end
end

-- Core functions

function StartMenu:load()
   title_font = love.graphics.newFont("assets/fonts/slkscr.ttf", TITLE_FONT_SIZE)
   normal_font = love.graphics.newFont("assets/fonts/slkscr.ttf", FONT_SIZE)
end

function StartMenu:update()
   self:actions()
end

function StartMenu:draw()
   self:drawTitle()
   self:pressEnterToStart()
   self:drawSelectOptions()
end
