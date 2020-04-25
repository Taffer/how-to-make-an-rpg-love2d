-- Configuration for How To Make An RPG.
--
-- By Chris Herborth (https://github.com/Taffer)
-- MIT license, see LICENSE for details.

function love.conf(t)
    t.window.title = "How To Make An RPG"
    t.window.width = 736 -- Was 740 originally, but that leaves a fractional tile.
    t.window.height = 480

    t.identity = "How To Make An RPG"
    t.version = 11.3 -- Made with Love 11.3.
    t.console = true
end
