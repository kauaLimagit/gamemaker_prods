if timer > 0 {
	y+=yspd
	x+=xspd
	timer--
}else {
	instance_destroy(self)
}