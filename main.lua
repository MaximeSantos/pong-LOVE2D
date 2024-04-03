require("player")

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
   -- Settings
   love.window.setTitle("Pong LÖVE2D")
   love.graphics.setDefaultFilter("nearest", "nearest")
   love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {fullscreen = false, resizable = false, vsync = true})
end

function love.update(dt)
end

function love.draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.printf("Hello World !", 0, WINDOW_HEIGHT / 2 - 16, WINDOW_WIDTH, "center")
   love.graphics.printf("Welcome to Pong in lua with LÖVE2D", 0, WINDOW_HEIGHT / 2, WINDOW_WIDTH, "center")
end
