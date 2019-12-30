function love.load()
    love.window.setTitle('epic game')
    image = love.graphics.newImage('turmp.png')
    blip = love.graphics.newImage('blip.png')
    blip1 = love.graphics.newImage('blip.png')
    -- Dimensions of bloop = 206 x 36
    -- so ranges:   bloop-x ± 103, bloop-y ± 18
    bloop1 = love.graphics.newImage('bloop.png')
    bloop2 = love.graphics.newImage('bloop.png')
end

-- function keyboardControl(sprite, up, down, left, right)
--
-- end

function love.update(dt)

end

function bounceAround(sprite, gravity)
    x = x + vx
    y = y + vy
    vy = vy + gravity

    if (x < 0 or x > 800) then
        vx = vx * -1
    end

    if (y < 0 or y > 600) then
        vy = vy * -1
    end

    if love.keyboard.isDown('return') then
        vx = love.math.random(-10, 10)
        vy = love.math.random(-10, 10)
    end
    if love.keyboard.isDown('down') then
        vy = vy + 1
    elseif love.keyboard.isDown('up') then
        vy = vy - 1
    elseif love.keyboard.isDown('right') then
        vx = vx + 1
    elseif love.keyboard.isDown('left') then
        vx = vx - 1
    end

    vy = vy + gravity
    love.graphics.draw(sprite,x, y)
end

vx = 10
vy = 5
vx1 = 7
vy1 = -4
x = 200
y = 100
x1 = 200
y1 = 400
p1_x = 10
p1_y = 300
p2_x = 750
p2_y = 100
p_v = 10

p1_score = 0
p2_score = 0

function love.draw()

    x1 = x1 + vx1
    y1 = y1 + vy1

    if (x1 < 0 or x1 > 800) then
        vx1 = vx1 * -1
    end

    if (y1 < 0 or y1 > 600) then
        vy1 = vy1 * -1
    end

    bounceAround(blip, 0.2, 0)
    -- love.graphics.draw(blip1, x1, y1)

    if love.keyboard.isDown('w') then
        p1_y = p1_y - p_v
    end
    if love.keyboard.isDown('s') then
        p1_y = p1_y + p_v
    end
    if love.keyboard.isDown('a') then
        p1_x = p1_x - p_v
    end
    if love.keyboard.isDown('d') then
        p1_x = p1_x + p_v
    end

    -- if love.keyboard.isDown('i') then
    --     p2_y = p2_y - p_v
    -- end
    -- if love.keyboard.isDown('k') then
    --     p2_y = p2_y + p_v
    -- end
    -- if love.keyboard.isDown('j') then
    --     p2_x = p2_x - p_v
    -- end
    -- if love.keyboard.isDown('l') then
    --     p2_x = p2_x + p_v
    -- end
    if x > 350 then
        while y > p2_y + 103 do
            p2_y = p2_y + p_v
        end
        while y < p2_y + 103 do
            p2_y = p2_y - p_v
        end
    end


    love.graphics.draw(bloop1, p1_x, p1_y)
    love.graphics.draw(bloop2, p2_x, p2_y)
    if (x < p1_x+18 and x > p1_x) and (y > p1_y and y < p1_y+206) then
        vx = vx * -1
    end
    if (x < p2_x+18 and x > p2_x) and (y > p2_y and y < p2_y+206) then
        vx = vx * -1
        vy = love.math.random(-15, 15)
    end


    love.graphics.print('xball: ' .. tostring(x) .. ' yball: ' .. tostring(y), 600, 500)
    love.graphics.print('Vxball: ' .. tostring(vx) .. ' Vyball: ' .. tostring(vy), 600, 50)
    love.graphics.print('p1X: '..tostring(p1_x)..' p1Y: '..tostring(p1_y))
end
