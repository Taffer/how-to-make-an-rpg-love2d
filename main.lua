-- Main for How To Make An RPG.
--
-- By Chris Herborth (https://github.com/Taffer)
-- MIT license, see LICENSE for details.

-- Horrible, horrible globals.
gameMap = {
    1, 1, 1, 1,  5, 6,  7, 1, -- 1
    1, 1, 1, 1,  5, 6,  7, 1, -- 2
    1, 1, 1, 1,  5, 6,  7, 1, -- 3
    3, 3, 3, 3, 11, 6,  7, 1, -- 4
    9, 9, 9, 9,  9, 9, 10, 1, -- 5
    1, 1, 1, 1,  1, 1,  1, 1, -- 6
    1, 1, 1, 1,  1, 1,  2, 3, -- 7
}

gameState = {
    -- Render size:
    gameWidth = 128,
    gameHeight = 112,

    -- Number of tiles visible (calculated at runtime):
    tileWidth = 0,
    tileHeight = 0,

    tilesPerRow = 0,
    tilesPerColumn = 0,

    -- Map constants.
    mapWidth = 8,
    mapHeight = 7
}

gameTextures = {
    -- Filled during love.load().
}

-- Required external packages.
local push = require "3rdparty.push.push"

-- Love callbacks.
function love.load()
    -- Actual window size is 2x the rendering size for that chunky pixels
    -- aesthetic.
    push:setupScreen(gameState.gameWidth, gameState.gameHeight, love.graphics.getWidth(), love.graphics.getHeight(),
        {
            canvas = true,
            resizable = false,
            pixelperfect = true,
            vsync = true
        })
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    gameTextures = {
        love.graphics.newImage('assets/tiles_00.png'),
        love.graphics.newImage('assets/tiles_01.png'),
        love.graphics.newImage('assets/tiles_02.png'),
        love.graphics.newImage('assets/tiles_03.png'),
        love.graphics.newImage('assets/tiles_04.png'),
        love.graphics.newImage('assets/tiles_05.png'),
        love.graphics.newImage('assets/tiles_06.png'),
        love.graphics.newImage('assets/tiles_07.png'),
        love.graphics.newImage('assets/tiles_08.png'),
        love.graphics.newImage('assets/tiles_09.png'),
        love.graphics.newImage('assets/tiles_10.png')
    }
    gameState.tileWidth = gameTextures[1]:getWidth()
    gameState.tileHeight = gameTextures[1]:getHeight()

    -- Calculate the number of tiles we can draw in a row based on the tile
    -- size.
    gameState.tilesPerRow = math.floor(gameState.gameWidth / gameState.tileWidth)
    gameState.tilesPerColumn = math.floor(gameState.gameHeight / gameState.tileHeight)
end

function love.draw()
    push:start()

    love.graphics.setColor(1, 1, 1, 1)
    for j = 0, gameState.tilesPerColumn - 1 do
        for i = 0, gameState.tilesPerRow - 1 do
            love.graphics.draw(gameTextures[gameMap[j * gameState.mapWidth + i + 1]],
                i * gameState.tileWidth, j * gameState.tileHeight)
        end
    end

    push:finish()
end

-- Event generation.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
