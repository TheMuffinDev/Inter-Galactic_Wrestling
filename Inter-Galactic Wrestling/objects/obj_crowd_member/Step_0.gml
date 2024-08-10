//Scaling
your_display_xscale += (your_display_xscale_to - your_display_xscale) / 5;
your_display_yscale += (your_display_yscale_to - your_display_yscale) / 5;
your_display_angle += (your_display_angle_to - your_display_angle) / 5;



//Jumping
if(in_air)
{
	y += y_speed;
	y_speed += grav;
	
	if(y + y_speed >= your_og_y)
	{
		y = your_og_y;
		y_speed = 0;
		in_air = false;
		
		if(keep_jumping)
			alarm[1] = 1;
	}
}