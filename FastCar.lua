FastCar = Class{}

local ACCELERATION = 0

local FAST_CAR_IMAGE = love.graphics.newImage('FastCar.png')

function FastCar:init()

	self.width = FAST_CAR_IMAGE:getWidth()
	self.height = FAST_CAR_IMAGE:getHeight()
	
	self.x = WINDOW_WIDTH / 2 - (self.width / 2)
	self.y = WINDOW_HEIGHT / 2 - (self.height / 2)
	
	self.dy = 0
end

function FastCar:update(dt)
	self.dy = self.dy + ACCELERATION * dt
	
	self.y = self.y + self.dy
end

function FastCar:render()
	love.graphics.draw(FAST_CAR_IMAGE, 0, 0, 0, .3)
end
	