-- Main for How To Make An RPG.
--
-- By Chris Herborth (https://github.com/Taffer)
-- MIT license, see LICENSE for details.

-- Required external packages.
local push = require "3rdparty.push.push"

-- Tiled maps.
local map = require 'assets.map'

-- Horrible, horrible globals.
gameMap = map.layers[1].data

gameState = {
    -- Texture atlas:
    atlas = love.graphics.newImage('assets/' .. map.tilesets[1].image),

    -- Render size (half the size of the window):
    gameWidth = 128,
    gameHeight = 112,

    -- Calculated at runtime based on window size.
    tilesPerRow = 0,
    tilesPerColumn = 0,

    batch = nil,

    -- Map constants.
    mapWidth = map.width,
    mapHeight = map.height
}

gameQuads = {
    -- Filled during love.load(). These are similar to the UVs used by the
    -- original code.
}

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

    for i = 0, 10 do
        gameQuads[i + 1] = love.graphics.newQuad(i * map.tilewidth, 0, map.tilewidth, map.tileheight,
            map.tilesets[1].imagewidth, map.tilesets[1].imageheight)
    end

    -- Calculate the number of tiles we can draw in a row based on the tile
    -- size.
    gameState.tilesPerRow = math.floor(gameState.gameWidth / map.tilewidth)
    gameState.tilesPerColumn = math.floor(gameState.gameHeight / map.tileheight)

    gameState.batch = love.graphics.newSpriteBatch(gameState.atlas, gameState.tilesPerRow * gameState.tilesPerColumn)
end

function love.draw()
    push:start()

    love.graphics.setColor(1, 1, 1, 1)
    gameState.batch:clear()
    for j = 0, gameState.tilesPerColumn - 1 do
        for i = 0, gameState.tilesPerRow - 1 do
            gameState.batch:add(gameQuads[gameMap[j * gameState.mapWidth + i + 1]], i * map.tilewidth, j * map.tileheight)
        end
    end
    gameState.batch:flush()
    love.graphics.draw(gameState.batch)

    push:finish()
end

-- Event generation.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
