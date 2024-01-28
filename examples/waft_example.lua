local Waft = require('waft')
local Instance = Waft.new()
local Timer = require('timer')

function love.load()
	love.graphics.setDefaultFilter('nearest')
	local pixel_font = love.graphics.newFont('pixel.ttf', 16)

		--duration	1,
		--color		{ 1,1,1,1 },
		--x 		love.math.random(0, love.graphics.getWidth()),
		--y 		love.math.random(0, love.graphics.getHeight()),
		--dx 		--random value between -100 and 100
		--dy 		--random value between -100 and 100
		--rotation	0,
		--scale		1,
		--fade		{ _in = 0.5, _out = 1}, --start of the fadeout, end of the fadeout.
		--font		love.graphics.getFont()

	--Every .25 seconds, spawn a popup. See Timer.lua for reference.
	Timer:every(0.25, function()
		
		--All properties are optional.
		local splat = Waft:splat('Bar', {
			duration = 2,
			color = {1,1,1,1}
		})
		Instance:splat('Foo', {
			color = {0,1,1,1},
			scale = 3,
			dx = 0,
			dy = 300
		})

		--After 1 second, set the font, color, and scale.
		Timer:after(1, function()
			splat:set('font', pixel_font)
			splat:set('color', {1,0,1,1})
			splat:set('scale', 3)
		end)

		--Every .5 seconds, invert dx,dy.
		Timer:every(0.5, function()
			splat:set('dx', -splat.props.dx)
			splat:set('dy', -splat.props.dy)
		end)
	end)
end

function love.update(dt)
	Timer:update(dt)
	Waft:update(dt)
	Waft:nudge('rotation', math.pi * dt)
	Instance:update(dt)
end

function love.draw()
	Waft:draw()
	Instance:draw()
end