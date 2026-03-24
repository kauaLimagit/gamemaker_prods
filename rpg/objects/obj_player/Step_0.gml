var movex = -keyboard_check(ord("A"))+keyboard_check(ord("D"))
var movey = -keyboard_check(ord("W"))+keyboard_check(ord("S"))
var invt_spear = keyboard_check_pressed(ord("E"))

if keyboard_check_pressed(ord("R")) {
	room_restart()
}

if movable == true {
	hsp = movex * vspd
	vsp = movey * vspd
}

switch (movex){
	case 1:
		image_xscale = 1;
		break;
	case -1:
		image_xscale = -1;
		break;
}

// player animação andar o parado
if movex != 0 {sprite_index = spr_player_horizontal_walk} else { sprite_index = spr_player_horizontal_defaut}

if place_meeting(x+(hsp+1), y, obj_colide){
	hsp = 0
}else if place_meeting(x,y+(vsp+1), obj_colide){
	vsp = 0
}

if invt_spear and global.spear_qnt == 1{
	if !instance_exists(obj_spear){
		instance_create_layer(x,y,"Spear",obj_spear)
	}else {
		instance_destroy(obj_spear)
	}
}

if global.teleport == true {
	if !instance_exists(obj_teleport_effect){
		instance_create_layer(x,y,"Spear",obj_teleport_effect)
	}
	
	image_blend = make_colour_hsv(120,1000,100)
}else {
	image_blend = c_white
}

x += hsp
y += vsp