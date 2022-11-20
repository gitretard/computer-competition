platform = {}
player = {}

function love.load()

	player.x = 400
	player.y = 300

	player.speed = 150

	player.img = love.graphics.newImage("player.png")
	platform.img = love.graphics.newImage("platform.png")

	player.groundchk = false
	
	player.y_velocity = 0

	player.jump_height = -400
	gravity = -600
	player.jumpc = 0
	player.jumpm = 2
end
function love.update(dt)
	playerstuff(dt)
end
function love.draw()
	love.graphics.draw(player.img,player.x,player.y)
	objmarkup()
	love.graphics.print(player.y)
end
function playerstuff(dt)
    --Controls
	if love.keyboard.isDown("a")then
		player.x = player.x - player.speed * dt
	end
	if love.keyboard.isDown("d")then
		player.x = player.x + player.speed * dt
	end
	if love.keyboard.isDown("space")then
		if player.groundchk then
		player.y_velocity = player.y_velocity + player.jump_height 
		player.groundchk = false
		end
	end
	--Gravity if groundchk = false
	if player.groundchk == false then
		player.y = player.y + player.y_velocity * dt
		player.y_velocity = player.y_velocity - gravity * dt
	end
	gdt = dt
end
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end
function makeobject(img,x,y,w,h)
	
	love.graphics.draw(img,x,y)
	if (CheckCollision(player.x,player.y,32,32 ,x,y,w,h)) then
			player.groundchk = true
			player.y_velocity = 0
			player.y = player.y
			if player.y < y and player.y > x - h then
				player.y = y - 32
				player.groundchk = true
			end
		else 
			player.groundchk = false
	
end
end
function objmarkup()
	
	makeobject(platform.img,400,400,128,32)
	
end
-- Somthing is wrong with jumping it isnt supposed to be like this
