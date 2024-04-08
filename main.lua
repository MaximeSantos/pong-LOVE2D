require("startmenu")
require("player")
require("ai")
require("ball")
require("ui")
require("gamestate")
require("debugger")

FONT_SIZE = 16
TITLE_FONT_SIZE = FONT_SIZE * 8

local normal_font
local player_1
local player_2

-- Helper functions

-- Core functions
function love.load()
   -- Settings not in conf.lua
   love.graphics.setDefaultFilter("nearest", "nearest")

   normal_font = love.graphics.newFont("assets/fonts/slkscr.ttf", FONT_SIZE)

   player_1 = Player:new(1)
   player_2 = Player:new(2)

   StartMenu:load()
   Ui:load()
   player_1:load()
   player_2:load()
   Ai:load()
   Ball:load()

   -- GameState:load()
   Debugger:load()
end

function love.update(dt)
   if GameState.is_start_menu then -- Start Menu
      StartMenu:update()
   else                            -- Actual game logic
      GameState:checkStartOfGame(player_1, player_2)
      Ui:update(dt)

      if GameState.is_started then -- Check if the game is running
         player_1:update(dt)
         if GameState.is_multiplayer then
            player_2:update(dt)
         else
            Ai:update(dt)
         end
         Ball:update(dt, player_1, player_2)
      end
   end

   Debugger:update(dt)
   -- GameState:update()
end

function love.draw()
   if GameState.is_start_menu then -- Start Menu
      StartMenu:draw()
   else                            -- Actual game logic
      love.graphics.setFont(normal_font)
      Ui:draw()
      player_1:draw()

      if GameState.is_multiplayer then -- Check if the game is set for multiplayer
         player_2:draw()
      else
         Ai:draw()
      end

      if GameState.is_started then -- Check if the game is running
         Ball:draw()
      end
   end

   Debugger:draw()
   -- GameState:draw()
end
