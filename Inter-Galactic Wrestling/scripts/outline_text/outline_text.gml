function outline_text(_x,_y,_text,_xscale,_yscale,_angle,_outline_width,_text_color,_outline_color){

//Outline
draw_set_color(_outline_color);
for(var rex = -1; rex <= 1; rex++)
{
	for(var rey = -1; rey <= 1; rey++)
	{
		draw_text_transformed(_x+rex*_outline_width,_y+rey*_outline_width,_text,_xscale,_yscale,_angle);
	}
}

//Text
draw_set_color(_text_color);
draw_text_transformed(_x,_y,_text,_xscale,_yscale,_angle);

}