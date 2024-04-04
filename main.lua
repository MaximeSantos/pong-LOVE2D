require("player")
require("ball")
require("ui")

FONT_SIZE = 16

local is_started = false

-- Helper functions
function checkStartOfGame(is_started)
   if not is_started then
      if Player:checkPlayerInput() then
         return true
      end
   end
   return false
end

-- Core functions
function love.load()
   -- Settings not in conf.lua
   love.graphics.setDefaultFilter("nearest", "nearest")

   Player:load()
   Ball:load()
end

function love.update(dt)
   Player:update(dt)
   Ball:update(dt, is_started)

   -- FIX Get this into a function
   if checkStartOfGame(is_started) then
      is_started = true
      Ball:startMoving(-1)
   end
end

function love.draw()
   Ui:draw(is_started)
   Player:draw()
   Ball:draw()
end
