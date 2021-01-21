Class = require 'class'
require 'FastCar'

WINDOW_WIDTH = 480
WINDOW_HEIGHT = 640

local road = love.graphics.newImage('road.png')
local roadside = love.graphics.newImage('roadside.png')

local roadScroll = 0
local roadsideScroll = 0
local roadScrollSpeed = 2500

local fastCar = FastCar()

function love.load()
	love.window.setTitle('Roadblocks')
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		vsync = 1,
		resizable = false
	})
end

function love.keypressed(key)
	if key == 'escape' then 
		love.event.quit()
	end
end

function love.update(dt)
	roadScroll = (roadScroll + roadScrollSpeed * dt)
		% WINDOW_HEIGHT
	roadsideScroll = (roadsideScroll + roadScrollSpeed * dt)
		% WINDOW_HEIGHT
	
	fastCar:update(dt)
end

function love.draw()
	love.graphics.draw(road, 0, roadScroll - WINDOW_HEIGHT)
	love.graphics.draw(roadside, 0, roadsideScroll - WINDOW_HEIGHT)
	fastCar:render()
end
