//Dying
if(ded)
{
	//Shrinking
	if(fade_type == "shrink")
	{
		image_xscale -= scale*fade_speed;
		image_yscale -= scale*fade_speed;
		if(image_yscale <= 0)
			instance_destroy();
	}
	
	//Fading
	if(fade_type == "fade")
	{
		image_alpha -= fade_speed;
		if(image_alpha <= 0)
			instance_destroy();
	}
	
	//Shrinking and Fading
	if(fade_type == "shrink and fade")
	{
		image_xscale -= scale*fade_speed;
		image_yscale -= scale*fade_speed;
		image_alpha -= fade_speed;
		if(image_alpha <= 0)
			instance_destroy();
	}
}

//Rotating
//if(rotate_speed != 0)
	image_angle += speed * rotate_direction;

//Changing Speed
if(speed_change != 0)
{
	if(speed_change > 0)
		speed += speed_change;
	
	if(speed_change < 0) && (speed > 0)
	{
		speed += speed_change;
		if(speed <= 0)
			speed = 0;
			speed_change = 0;
	}
}