//Shaking
var _shake_x = random_range(screenshake, screenshake*-1);
var _shake_y = random_range(screenshake, screenshake*-1);

//Weird Camera Stuff
var viewmat = matrix_build_lookat(x+_shake_x,y+_shake_y,-100,x+_shake_x,y+_shake_y,0,0,1,0);
var projmat = matrix_build_projection_ortho(cam_width*zoom,cam_height*zoom,1.0,32000.0);

camera_set_view_mat(camera,viewmat);
camera_set_proj_mat(camera,projmat);


//Screenshake
if(screenshake_decrease != 0)
{
	screenshake -= screenshake_decrease;
	if(screenshake < 0)
	{
		screenshake = 0;
		screenshake_decrease = 0;
	}
}


//Timing
if(increase_time)
{
	timing.miliseconds += 100 / 60;
	if(timing.miliseconds > 99)
	{
		timing.miliseconds = 0;
		timing.seconds++;
		if(timing.seconds > 59)
		{
			timing.seconds = 0;
			timing.minutes++;
		}
	}
}


//Changing Values
versus_add += (versus_add_to - versus_add) / 7;



//Screen Zoom
/*
if(instance_exists(obj_enemy_parent))
{
	with(obj_player)
		var _distance = distance_to_object(obj_enemy_parent);
	zoom_to = 0.8 + _distance / 1500;
}

zoom += (zoom_to - zoom) / 5;
*/