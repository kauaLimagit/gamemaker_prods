if timer != 0 {
	timer--
}

if dirx > x {
		x += vspd
	}else {
		x -= vspd
	}
	
	if diry > y {
		y += vspd
	}else {
		y-= vspd
	}
	
	if dirx == x and diry == y{
		reached_dir = true
	}
	
if timer == 0{
	dirx = irandom_range(40,800)
	diry = irandom_range(40,500)
	timer = 120
}