if timer > 0 {
	image_xscale += expansion_vel
	image_yscale += expansion_vel
	timer--
}else {
	instance_destroy(self)
}