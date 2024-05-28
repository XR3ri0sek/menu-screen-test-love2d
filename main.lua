tween = require 'modules/tween'

debug = true

numbertween = {
	menusize = 0
}

menu_font = love.graphics.newFont("fonts/gGuarantee.ttf",20)
debug_font = love.graphics.newFont("fonts/Inconsolata.ttf",15)
title_font = love.graphics.newFont("fonts/BebasNeue.otf",80)

function love.load()
	--// Menu Stuff
	menuOption = 0

	menu_line_pos_x = 0
	menu_line_pos_y = 0
	menu_line_size_x = {
		number = 0
	}
	menu_line_size_y = 0

	menu_play = {
		color = {1, 1, 1},
	}
	menu_settings = {
		color = {1, 1, 1},
	}
	menu_ex = {
		color = {1, 1, 1},
	}
end

function love.update(dt)
	function love.keypressed(key, scancode, isrepeat)
		if key == "space" then
			if menuOption == 1 then
				print("game starting")
			elseif menuOption == 2 then
				print("settings")
			elseif menuOption == 3 then
				love.event.quit()
			end
		end

		--Controlling The Menu
		if key == "down" then
			menuOption = menuOption + 1
			menu_line_size_x.number = 0
			if menuOption == 4 then
				menuOption = 1
			end
		end
		if key == "up" then
			menuOption = menuOption - 1
			menu_line_size_x.number = 0
			if menuOption == 0 then
				menuOption = 3
			elseif menuOption == -1 then
				menuOption = 3
			end
		end
	end

	function menuLine()
		if menuOption == 0 then
			menu_line_pos_x = 0
			menu_line_pos_y = 0
			menu_line_size_y = 0
			menu_play.color = {1, 1, 1}
			menu_settings.color = {1, 1, 1}
			menu_ex.color = {1, 1, 1}
		elseif menuOption == 1 then
			menu_line_pos_x = 15
			menu_line_pos_y = 326
			menu_line_size_y = 26
			menu_play.color = {0, 0, 0}
			menu_settings.color = {1, 1, 1}
			menu_ex.color = {1, 1, 1}
		elseif menuOption == 2 then
			menu_line_pos_x = 15
			menu_line_pos_y = 356
			menu_line_size_y = 26
			menu_play.color = {1, 1, 1}
			menu_settings.color = {0, 0, 0}
			menu_ex.color = {1, 1, 1}
		elseif menuOption == 3 then
			menu_line_pos_x = 15
			menu_line_pos_y = 386
			menu_line_size_y = 26
			menu_play.color = {1, 1, 1}
			menu_settings.color = {1, 1, 1}
			menu_ex.color = {0, 0, 0}
		end
	end
	menuLine()

	if menuOption == 0 then

	elseif menuOption == 1 then
		tween.new(0.1, menu_line_size_x, {number = 300}):update(dt)
	elseif menuOption == 2 then
		tween.new(0.1, menu_line_size_x, {number = 300}):update(dt)
	elseif menuOption == 3 then
		tween.new(0.1, menu_line_size_x, {number = 300}):update(dt)
	end
end

--//Draw the menu
function love.draw()
	love.graphics.setFont(debug_font)
	love.graphics.setColor(1,1,1)
	love.graphics.print("Pixel Engine 1.0 (demo)", 2, 2)
	love.graphics.print("fps: "..love.timer.getFPS(), 2, 17)
	love.graphics.print("menuOption: "..menuOption, 2, 33)

	--Creating Menu Title
	love.graphics.setFont(title_font)
	love.graphics.setColor(1, 1, 1)
	love.graphics.printf("Traumatic Night", 20, 230, 800)

	--Creating Menu Line
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('fill', menu_line_pos_x, menu_line_pos_y, menu_line_size_x.number, menu_line_size_y)

	--Creating Menu Options
	love.graphics.setFont(menu_font)

	love.graphics.setColor(menu_play.color)
	love.graphics.printf("PLAY", 20, 330, 800) --play

	love.graphics.setColor(menu_settings.color)
	love.graphics.printf("SETTINGS", 20, 360, 800) --settings

	love.graphics.setColor(menu_ex.color)
	love.graphics.printf("EXIT", 20, 390, 800) --exit
end