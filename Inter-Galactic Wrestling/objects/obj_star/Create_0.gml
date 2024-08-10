//Variables
x_add = 0;
y_add = 0;

tick_counter = 0;
lifetime = irandom_range(75,120);
ded = false;

//Fancy or Small
if(choose(1,2,3,4) == 1)
{
	//Fancy Stars
	star_speed = random_range(2,4);
	direction = -15;
	image_alpha = 0;
	sprite_index = spr_star;
	image_index = irandom_range(0,1);
	image_blend = make_color_hsv(irandom_range(0,255),85,255);
	
	if(room = room_mutations)
	image_blend = make_color_hsv(irandom_range(85,115),85,255);
	
	if(image_index == 1)
	{
		rotate_speed = random_range(0.05,0.1) * -1;
	}
	else
	{
		rotate_speed = random_range(0.2,0.45) * -1;
	}
	
	image_angle = (rotate_speed * lifetime / 2) * -1;
	
	var _scale = random_range(0.15,.3);
}
else
{
	//Circle Stars
	star_speed = random_range(0.5,2);
	rotate_speed = 0;
	direction = -15;
	image_alpha = 0;
	sprite_index = spr_particle;
	image_index = 0;
	image_index = 0;
	
	var _scale = random_range(0.08,0.12);
}


image_xscale = _scale;
image_yscale = _scale;