function love.conf(t)
   -- Game settings
   t.title = "Pong LÖVE2D"
   t.version = "11.3" -- The LÖVE version this game was made for (string)
   t.console = false

   -- Window settings
   t.window.fullscreen = false -- Enable fullscreen (boolean)
   t.window.borderless = false -- Remove all border visuals from the window (boolean)
   t.window.resizable = false -- Let the window be user-resizable (boolean)
   t.window.vsync = 1 -- Vertical sync mode (number)
   t.window.width = 1280
   t.window.height = 720
   t.window.icon = nil -- Filepath to an image to use as the window's icon (string)

   -- Disable unnecessary modules
   t.modules.keyboard = true -- Enable the keyboard module (boolean)
   t.modules.physics = false -- Enable the physics module (boolean)
   t.modules.touch = false -- Enable the touch module (boolean)
end
