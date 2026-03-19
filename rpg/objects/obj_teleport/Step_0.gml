if keyboard_check_pressed(ord("F")) and global.spear_qnt == 0 {
	global.teleport = true
	timer_start = true
}

if timer_start {
	if timer > 0 {
		timer--
	}else {
		global.teleport = false
		obj_player.x = obj_spear.x
		obj_player.y = obj_spear.y
		timer = 60 
		timer_start = false
	}
}