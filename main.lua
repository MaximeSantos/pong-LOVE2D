require("player")
require("ai")
require("ball")
require("ui")
require("gamestate")
require("debugger")

FONT_SIZE = 16
local font

-- Helper functions
-- TODO FIX Bug when handling hit detection on left player (ball coming from low angle, sliding off then through the paddle)
function checkEntitiesCollisions(a, b) -- Checks for collisions between two objects with x, y, width and height properties
   if a.x < b.x + b.width and a.x + a.width > b.x and a.y < b.y + b.height and a.y + a.height > b.y then
      return true
   end
   return false
end

-- Core functions
function love.load()
   -- Settings not in conf.lua
   love.graphics.setDefaultFilter("nearest", "nearest")

   font = love.graphics.newFont(FONT_SIZE)

   Ui:load()
   Player:load()
   Ai:load()
   Ball:load()
   GameState:load()
   Debugger:load()
end

function love.update(dt)
   GameState:checkStartOfGame()
   Ui:update(dt)
   GameState:update(dt)

   if GameState.is_started then
      Player:update(dt)
      Ai:update(dt)
      Ball:update(dt)
   end
end

function love.draw()
   love.graphics.setFont(font)
   Ui:draw()
   Player:draw()
   Ai:draw()
   if GameState.is_started then
      Ball:draw()
   end
   GameState:draw()
   Debugger:draw()
end
