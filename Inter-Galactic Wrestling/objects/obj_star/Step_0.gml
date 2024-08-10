//Lifetime
if(!ded)
{
	//Increaseing the Tick Counter
	tick_counter++;
	if(tick_counter >= lifetime)
		ded = true;
	
	//Fading In
	if(image_alpha < 1)
		image_alpha += 0.01;
}
else
{
	//Fading Out
	image_alpha -= 0.02;
	if(image_alpha <= 0)
		instance_destroy();
}


//Moving
x_add += lengthdir_x(star_speed,direction);
y_add += lengthdir_y(star_speed,direction);
x = obj_camera.x + x_add;
y = obj_camera.y + y_add;


//Rotating
image_angle += rotate_speed;