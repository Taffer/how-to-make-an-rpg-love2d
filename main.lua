-- Main for How To Make An RPG.
--
-- By Chris Herborth (https://github.com/Taffer)
-- MIT license, see LICENSE for details.

-- Horrible, horrible globals.
gameState = {
    grass = nil
}

-- Love callbacks.
function love.load()
    math.randomseed(os.time())

    love.graphics.setDefaultFilter('nearest', 'nearest')
    gameState.grass = love.graphics.newImage('assets/grass_tile.png')
end

function love.draw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gameState.grass)
end

-- Event generation.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
