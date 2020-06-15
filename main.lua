-- Main for How To Make An RPG.
--
-- By Chris Herborth (https://github.com/Taffer)
-- MIT license, see LICENSE for details.

-- Horrible, horrible globals.
gameState = {
    -- Render size:
    gameWidth = 736, -- Was 740 originally, but that leaves a fractional tile.
    gameHeight = 480,

    -- Sprites:
    grass = nil,

    -- Number of tiles visible:
    tilesPerRow = 0,
    tilesPerColumn = 0
}

local push = require "3rdparty.push.push"

-- Love callbacks.
function love.load()
    push:setupScreen(gameState.gameWidth, gameState.gameHeight, love.graphics.getWidth(), love.graphics.getHeight(),
        {
            canvas = true,
            resizable = false,
            pixelperfect = true,
            vsync = true
        })

    math.randomseed(os.time())

    love.graphics.setDefaultFilter('nearest', 'nearest')
    gameState.grass = love.graphics.newImage('assets/grass_tile.png')

    -- Calculate the number of tiles we can draw in a row based on the tile
    -- size.
    gameState.tilesPerRow = math.floor(gameState.gameWidth / gameState.grass:getWidth())
    gameState.tilesPerColumn = math.floor(gameState.gameHeight / gameState.grass:getHeight())
end

function love.draw()
    push:start()

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gameState.grass)

    local y = 32
    local x = 32
    love.graphics.print('Display width: ' .. love.graphics.getWidth(), x, y)
    y = y + 16
    love.graphics.print('Display height: ' .. love.graphics.getHeight(), x, y)
    y = y + 16
    love.graphics.print('Tiles per row: ' .. gameState.tilesPerRow, x, y)
    y = y + 16
    love.graphics.print('Tiles per column: ' .. gameState.tilesPerColumn, x, y)

    push:finish()
end

-- Event generation.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
