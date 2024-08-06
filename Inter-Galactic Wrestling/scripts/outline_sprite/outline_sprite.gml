// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function outline_sprite(_sprite,_index,_x,_y,_xscale,_yscale,_angle,_outline_color,_outline_width){

//Actually Outlining
draw_set_color(_outline_color);
gpu_set_fog(true,_outline_color,0,1);

for(var rex = -1; rex <= 1; rex++)
{
	for(var rey = -1; rey <= 1; rey++)
	{
		draw_sprite_ext(_sprite,_index,_x+rex*_outline_width,_y+rey*_outline_width,_xscale,_yscale,_angle,c_white,image_alpha);
	}
}

gpu_set_fog(false,_outline_color,0,1);

}