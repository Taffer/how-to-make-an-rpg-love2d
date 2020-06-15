-- Configuration for How To Make An RPG.
--
-- By Chris Herborth (https://github.com/Taffer)
-- MIT license, see LICENSE for details.

function love.conf(t)
    t.window.title = "How To Make An RPG"
    t.window.width = 256  -- These are double the render size; we use "push"
    t.window.height = 224 -- for pixel doubling.

    t.identity = "How To Make An RPG"
    t.version = 11.3 -- Made with Love 11.3.
    t.console = true

    -- Things we don't need.
    t.modules.joystick = false
    t.modules.physics = false
end
