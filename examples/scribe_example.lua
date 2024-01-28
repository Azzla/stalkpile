local Scribe = require('scribe')
local Timer = require('timer')

function love.load()
	love.graphics.setDefaultFilter('nearest')
	local pixel_font = love.graphics.newFont('pixel.ttf', 16)
	local type_sfx = love.audio.newSource('type_1.ogg', 'static')

	---- Defaults:
	--
	-- 	delay		= 0.1
	--	linger		= 1
	-- 	color		= { 1,1,1,1 }
	-- 	x 			= 0
	-- 	y 			= 0
	-- 	width 		= love.graphics.getWidth()
	-- 	justify 	= 'left'
	--	scale		= 1
	-- 	sounds		= {}
	--	font		= love.graphics.getFont()
	--	custom		= nil

	---- Scroll-Specific:
	--
	--	wait			= 1
	--	speed			= <delay>
	--	scroll_sounds 	= false

	--All properties are optional.
	local properties =
	{
		delay		= 0.15,
		linger		= 5,
		color		= {1,0,1,1},
		y 			= love.graphics.getHeight()/3,
		scale 		= 5,
		justify		= 'center',
		font 		= pixel_font,
		sounds		= type_sfx,
		speed		= 0.05
	}
	
	Scribe:write('This is a default :write from Scribe.')
	Scribe:scroll('This is a default :scroll from Scribe.', { y = 100 })
	Scribe:scroll('I am a customized :scroll.', properties)
end

function love.update(dt)
	Scribe:update(dt)
end

function love.draw()
	Scribe:draw()
end

