require("player")
require("ball")
require("ui")
require("gamestate")

FONT_SIZE = 16

-- Helper functions

-- Core functions
function love.load()
   -- Settings not in conf.lua
   love.graphics.setDefaultFilter("nearest", "nearest")

   Ui:load()
   Player:load()
   Ball:load()
   GameState:load()
end

function love.update(dt)
   Ui:update(dt)
   Player:update(dt)
   Ball:update(dt)
   GameState:update(dt)

   GameState:checkStartOfGame()
end

function love.draw()
   Ui:draw()
   Player:draw()
   Ball:draw()
   GameState:draw()
end
