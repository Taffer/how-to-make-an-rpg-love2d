-- Main for How To Make An RPG.
--
-- By Chris Herborth (https://github.com/Taffer)
-- MIT license, see LICENSE for details.

-- Horrible, horrible globals.
gameState = {
    grass = nil,
    tilesPerRow = 0,
    tilesPerColumn = 0
}

-- Love callbacks.
function love.load()
    math.randomseed(os.time())

    love.graphics.setDefaultFilter('nearest', 'nearest')
    gameState.grass = love.graphics.newImage('assets/grass_tile.png')

    -- Calculate the number of tiles we can draw in a row based on the tile
    -- size.
    gameState.tilesPerRow = math.floor(love.graphics.getWidth() / gameState.grass:getWidth())
    gameState.tilesPerColumn = math.floor(love.graphics.getHeight() / gameState.grass:getHeight())
end

function love.draw()
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
end

-- Event generation.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
