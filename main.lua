-- Main for How To Make An RPG.
--
-- By Chris Herborth (https://github.com/Taffer)
-- MIT license, see LICENSE for details.

-- Required external packages.
local push = require "3rdparty.push.push"

-- Tiled maps.
local map = require 'assets.map'

-- Horrible, horrible globals.
gameState = {
    -- Texture atlas:
    atlas = love.graphics.newImage('assets/' .. map.tilesets[1].image),
    quads = {
        -- Filled during love.load(). These are similar to the UVs used by the
        -- original code.
    },

    -- Render size (half the size of the window):
    gameWidth = 736,
    gameHeight = 480,

    -- Calculated at runtime based on window size.
    tilesPerRow = 0,
    tilesPerColumn = 0,

    batch = nil,

    -- Map constants.
    mapWidth = map.width,
    mapHeight = map.height
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

    local tile_width = map.tilesets[1].tilewidth
    local tile_height = map.tilesets[1].tileheight
    local atlas_width = map.tilesets[1].imagewidth
    local atlas_height = map.tilesets[1].imageheight
    local tile_spacing = map.tilesets[1].spacing
    for y = 0, (map.tilesets[1].imageheight / map.tilesets[1].tileheight) - 1 do
        for x = 0, map.tilesets[1].columns - 1 do
            local atlas_x = x * tile_width + x * tile_spacing
            local atlas_y = y * tile_height + y * tile_spacing
            gameState.quads[x + y * map.tilesets[1].columns + 1] = love.graphics.newQuad(atlas_x, atlas_y, tile_width, tile_height,
                atlas_width, atlas_height)
        end
    end

    -- Calculate the number of tiles we can draw in a row based on the tile
    -- size.
    gameState.tilesPerRow = math.floor(gameState.gameWidth / map.tilewidth)
    gameState.tilesPerColumn = math.floor(gameState.gameHeight / map.tileheight)

    gameState.batch = love.graphics.newSpriteBatch(gameState.atlas, gameState.tilesPerRow * gameState.tilesPerColumn * 2)
end

function love.draw()
    push:start()

    love.graphics.clear(0, 0, 0, 1)
    love.graphics.setColor(1, 1, 1, 1)

    -- Layer 1 is base textures, layer 2 is the items on top (roads, etc.).
    for layer = 1, 2 do
        local gameMap = map.layers[layer].data
        gameState.batch:clear()
        for y = 0, gameState.tilesPerColumn - 1 do
            for x = 0, gameState.tilesPerRow - 1 do
                local quad = gameMap[x + y * map.width + 1]
                if quad > 0 then
                    gameState.batch:add(gameState.quads[quad], x * map.tilewidth, y * map.tileheight)
                end
            end
        end
        gameState.batch:flush()
        love.graphics.draw(gameState.batch)
    end

    -- Draw the mouse position, showing tile co-ordinates.
    local x, y = love.mouse.getPosition()
    x, y = push:toGame(x, y)
    if x ~= nil and y ~= nil then
        -- We're on-screen.
        local tile_x = math.floor(x / map.tilewidth) + 1
        local tile_y = math.floor(y / map.tileheight) + 1

        love.graphics.print('X:' .. tile_x .. ' Y:' .. tile_y, x, y)
    end

    push:finish()
end

-- Event generation.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
