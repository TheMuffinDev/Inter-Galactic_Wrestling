//Inheret Event
event_inherited();



//Drawing
var _shake_x = random_range(shake, shake*-1);
var _shake_y = random_range(shake, shake*-1);

//Drawing Self
draw_sprite_ext(sprite_index,image_index,x+_shake_x,y+_shake_y,display_xscale*facing,display_yscale,display_angle*facing*turn_dir,image_blend,image_alpha);

//Flashing White
if(flashing_white > 0)
{
	gpu_set_fog(true,c_white,0,1);
	draw_sprite_ext(sprite_index,image_index,x+_shake_x,y+_shake_y,display_xscale*facing,display_yscale,display_angle*facing*turn_dir,image_blend,image_alpha);
	gpu_set_fog(false,c_white,0,1);
}



//Turning
if(turning = true)
{
	display_angle_to += turn_speed;
	display_angle_to += turn_speed;
	turn_speed -= 1;
	if(display_angle < 0)
	{
		display_angle = 0;
		display_angle_to = 0;
		turn_speed = 0;
		turning = false;
	}
	sprite_index = spr_mr_punchy_hit;
}
else
{
	sprite_index = spr_mr_punchy;
}