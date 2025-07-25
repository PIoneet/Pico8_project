pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
	move = {
		
		bar1_x = 0,
		bar1_y = 54,
	
		bar2_x = 128,
		bar2_y =	54,
		
		bar3_x = 55,
		bar3_y = 128,
	
		ball_x = 64,
		ball_y = 64
	}
	
	move_speed =4
	game_start = false
	score = 1234
	
	state = "menu"
	
end

function _update()
	btn_press()
	screen_out()
	state_change()
	
end

function _draw()

	if state == "menu" then
		cls(5)
		game_intro()
	elseif state == "play" then
		cls(1)
		circfill(move["ball_x"],move["ball_y"],3, 10)
		sspr(8,0,1,8,move["bar1_x"], move["bar1_y"],3,22)
		sspr(23,0,1,8,move["bar2_x"], move["bar2_y"],-3,22)
		sspr(24,7,8,1,move["bar3_x"], move["bar3_y"],22,-3)
		print('score: '..score, 8,8, 8)
	end
end

function game_intro()

	print("game start",47,58,6)
	print("press x", 47, 65, 6)
end

function state_change()
	if btnp(❎) then 
		state = "play"
	end
end

function btn_press()

	if (btn(0)) then
		move["bar3_x"] -= move_speed
	end
	if (btn(1)) then
		move["bar3_x"] += move_speed
	end
	if (btn(2)) then
		move["bar2_y"] -= move_speed
	end
	if (btn(3)) then
		move["bar2_y"] += move_speed
	end
	if (btn(4)) then
		move["bar1_y"] -= move_speed
	end
	if (btn(5)) then
		move["bar1_y"] += move_speed
	end
end

function screen_out()

	if(move["bar3_x"]<=0) then
		move["bar3_x"] = 0
	end
	if(move["bar3_x"]>=108) then
		move["bar3_x"] = 108
	end
	
	if(move["bar1_y"]<=0) then
		move["bar1_y"] = 0
	end
	if(move["bar1_y"]>=108) then
		move["bar1_y"] = 108
	end
	
	if(move["bar2_y"]<=0) then
		move["bar2_y"] = 0
	end
	if(move["bar2_y"]>=108) then
		move["bar2_y"] = 108
	end

end
__gfx__
00000000700000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700700000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000700000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000700000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700700000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000000000000777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
