//Outlining
outline_width += (outline_width_to - outline_width) / 5;
outline_width = floor(outline_width);

if(outline_width > 0)
{
	outline_sprite(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,outline_color,outline_width);
}



//Drawing Self
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);



//Interaction
if(can_interact)
{
	set_up_text(font_base,outline_color,fa_center,fa_center);
	outline_text(x,y+z_position_add+sine_wave(current_time / 1000, 1, -10, 0),"Z: View Fights",1,1,0,6,outline_color,c_black);
}



//Scaling
image_yscale = sine_wave(current_time / 1000, 1, 0.015, 1)