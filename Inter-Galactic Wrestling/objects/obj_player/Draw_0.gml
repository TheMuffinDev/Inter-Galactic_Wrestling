//Drawing Self
draw_sprite_ext(sprite_index,image_index,x,y,display_xscale*facing,display_yscale,display_angle*facing,image_blend,image_alpha);


//Flashing White
if(flashing_white > 0)
{
	gpu_set_fog(true,c_white,0,1);
	draw_sprite_ext(sprite_index,image_index,x,y,display_xscale*facing,display_yscale,display_angle*facing,image_blend,image_alpha);
	gpu_set_fog(false,c_white,0,1);
}
	

//Scaling
display_xscale += (display_xscale_to - display_xscale) / 5;
display_yscale += (display_yscale_to - display_yscale) / 5;
display_angle += (display_angle_to - display_angle) / 5;




//Testing
draw_set_color(c_white);
draw_set_font(font_base);
//draw_text(mouse_x,mouse_y-75,string(y_speed));