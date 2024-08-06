//Outlining
outline_width += (outline_width_to - outline_width) / 5;
if(outline_width > 0)
{
	outline_sprite(sprite_index,image_index,x,y,display_xscale*facing,display_yscale,display_angle*facing,outline_color,outline_width);
}


var _shake_x = random_range(shake, shake*-1);
var _shake_y = random_range(shake, shake*-1);


//Drawing
if(!dont_draw)
{	
	//Drawing Self
	draw_sprite_ext(sprite_index,image_index,x+_shake_x,y+_shake_y,display_xscale*facing,display_yscale,display_angle*facing,image_blend,image_alpha);
	
	//Flashing White
	if(flashing_white > 0)
	{
		gpu_set_fog(true,c_white,0,1);
		draw_sprite_ext(sprite_index,image_index,x+_shake_x,y+_shake_y,display_xscale*facing,display_yscale,display_angle*facing,image_blend,image_alpha);
		gpu_set_fog(false,c_white,0,1);
	}
}

//Scaling
display_xscale += (display_xscale_to - display_xscale) / 5;
display_yscale += (display_yscale_to - display_yscale) / 5;
display_angle += (display_angle_to - display_angle) / 5;