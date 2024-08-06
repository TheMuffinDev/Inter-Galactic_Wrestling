/// @description Walking
if(display_angle_to == 0)
{
	display_angle_to = -7;
	squish(1.2,0.85);
	image_index = 0;
}
else
{
	display_angle_to *= -1;
	squish(1.2,0.85);
	image_index++;
}

alarm[0] = 12;