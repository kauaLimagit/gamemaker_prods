var move = -keyboard_check(ord("A"))+keyboard_check(ord("D"))
var movey = -keyboard_check(ord("W"))+keyboard_check(ord("S"))
var jmp = keyboard_check_pressed(vk_space)
var shift = keyboard_check(vk_shift)

//laser

if mouse_check_button(mb_left) {
	instance_create_layer(x,y-25,"Instances",obj_laser)
}

//laser end

if keyboard_check_pressed(ord("R")){ room_restart() }

switch (move) {
	case 1:
		image_xscale = 1;
		break;
	case -1:
		image_xscale = -1;
		break;
}

if move != 0 and shift {
	hsp = (move * hspd_run)
	if flying == false { sprite_index = spr_homelader_running }
	audio_stop_sound(snd_homelander_walk)
	if !audio_is_playing(snd_homelander_run) and !flying{
		audio_play_sound(snd_homelander_run,1,true)
	}
	
}else if move != 0{
	hsp = (move * hspd_walk)
	if flying == false { sprite_index = spr_homelader_walk}
	audio_stop_sound(snd_homelander_run)
	if !audio_is_playing(snd_homelander_walk) and !flying{
		audio_play_sound(snd_homelander_walk,1,true)
	}

}else {
	if hsp != 0 {
		if flying == false { sprite_index = spr_homelader_stopping_ground }
		hsp -= (sign(hsp) * .2)
	}else {
		audio_stop_all()
		som = true
		if flying == false { sprite_index = spr_homelader_defaut }
	}
	
}

if place_meeting(x+ (sign(hsp)*2),y,obj_colision){
	hsp = 0
}



if !place_meeting(x + (sign(move) * -2) ,y+ (grv_scale +2),obj_colision){
	grv_scale += grv
	
	if keyboard_check_pressed(ord("E")){
		grv_scale = shock_wave_vel
		cause_shock_wave = true
		if flying{
			flying = false
		}
	}
	
	if jmp and flying == false{
		flying = true
		grv_scale = 0
	}else if jmp and flying == true{
		flying = false
	}
	
	if flying == false and grv_scale < 0 and !place_meeting(x,y+5, obj_colision){
		image_speed = 0
		sprite_index = spr_jump_poses
		image_index = 0
	}else if flying == false and grv_scale >0 and !place_meeting(x,y+5, obj_colision) {
		image_speed = 0
		sprite_index = spr_jump_poses
		image_index = 1
	}else {
		image_speed = 1
	}
}else {
	grv_scale = 0
	
	if jmp and shift {
		grv_scale -= super_jump
	}else if jmp {
		grv_scale -= jump
	}
	
	if cause_shock_wave == true {
		instance_create_layer(x,y,"Instances",obj_shock_wave)
		for (var i = 0; i < particles_create; i++){
			instance_create_layer(x,y+15,"Instances",obj_shock_effect)
		}
		cause_shock_wave = false
	}
}

if flying == true {
	grv = 0
	
	if movey != 0 and shift {
		grv_scale = (movey * vspd_faster)
	}else if movey != 0{
		grv_scale = (movey * vspd)
		sprite_index = spr_homelader_flying
	}else {
		sprite_index = spr_homelader_flying
		if grv_scale != 0 {
			grv_scale -= (sign(grv_scale) * .1)
		}
	}
}else {
	grv = .3
}

// punch


if keyboard_check(ord("F")) {
	if current_punch > 0 {
		current_punch--
	}
	
	global.punch = true
	hsp += move * current_punch
	if !audio_is_playing(snd_homelander_punch){
		audio_play_sound(snd_homelander_punch,2,false)
	}
	if move != 0 and current_punch > 0{ sprite_index = spr_homelader_punch }
}else {
	current_punch = punch_vel
	global.punch = false
}

// punch end


x+=hsp

y+= grv_scale

