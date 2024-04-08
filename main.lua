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

   player_1 = Player:new()
   player_2 = Player:new() -- Instantiate somewhere else in if statement ?

   StartMenu:load()
   Ui:load()
   player_1:load()
   Ai:load()
   Ball:load()
   GameState:load()
   Debugger:load()
end

function love.update(dt)
   if GameState.is_start_menu then -- Start Menu
      StartMenu:update()
   else                            -- Actual game logic
      GameState:checkStartOfGame(player_1, player_2)
      Ui:update(dt)
      GameState:update(dt)

      if GameState.is_started then -- Check if the game is running
         player_1:update(dt)
         Ai:update(dt)
         Ball:update(dt, player_1, player_2)
      end
   end
end

function love.draw()
   if GameState.is_start_menu then -- Start Menu
      StartMenu:draw()
   else                            -- Actual game logic
      love.graphics.setFont(normal_font)

      Ui:draw()
      player_1:draw()
      Ai:draw()

      if GameState.is_started then -- Check if the game is running
         Ball:draw()
      end

      -- GameState:draw()
      -- Debugger:draw()
   end
end
