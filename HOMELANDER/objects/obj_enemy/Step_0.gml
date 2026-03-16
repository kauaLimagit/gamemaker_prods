

if target.x < x and follow_target{
	image_xscale = -1
	
	if follow_target and !place_meeting(x-2,y,target){
		hsp = -vspd
	}
}else if target.x > x and follow_target {
	image_xscale = 1
	if follow_target and !place_meeting(x+2,y,target){
		hsp = vspd
	}
}

if !place_meeting(x,y+(grv_scale + 2),obj_colision){
	grv_scale += grv
}else {
	grv_scale = 0
}

y += grv_scale

// receber soco

if cooldown >0 {
	follow_target = false
	cooldown --
}else {
	follow_target = true
}

if place_meeting(x + (image_xscale * 5),y,obj_homelander) and global.punch == true {
	if cooldown == 0 {
		follow_target = false
		grv_scale -= punch_launch_vely
	
		switch(image_xscale){
			case 1:
				hsp -= punch_launch_vel;
				break;
			case -1:
				hsp += punch_launch_vel;
				break;
		}
		hp--
		cooldown = 30
	}
}

if place_meeting(x + (hsp),y,obj_colision){
	hsp = 0
}


if hsp != 0 {
	hsp -= sign(hsp) * 1
}

x += hsp

if hp == 0{
	follow_target = false
	image_angle = image_xscale * 90
}