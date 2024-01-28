local Timer = require('timer')
local player_health = 100

function love.load()
	local damage_health = Timer:every(0.5, function() player_health = player_health - 10 end)
	Timer:after(3, function()
		Timer:cancel(damage_health)
		Timer:after(1, function() player_health = player_health + 100 end)
	end)
end

function love.update(dt)
	Timer:update(dt)
end

function love.draw()
	love.graphics.print(tostring(player_health), 100, 100)
end