var dir = point_direction(x,y,mouse_x,mouse_y)

if timer > 0 {timer--}

if shoot == false and on_player == false {
	if speed != 0 {
		speed--
	}
	
	if place_meeting(x,y,obj_colide) and colided == false{
		direction = -dir
		speed -= colided_break
		colided = true
	}
	
	if place_meeting(x,y,obj_player) and timer == 0{
		global.spear_qnt = 1
		on_player = true
	}
}

if shoot == true {
	speed = atk_speed
	direction = dir
	shoot = false
}

if on_player == true {
	x = obj_player.x 
	y = obj_player.y -15
	
	image_angle = (dir + -90)
}

if mouse_check_button_pressed(mb_left){
	shoot = true
	on_player = false
	global.spear_qnt = 0
	timer = 30
}