// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_mutations_ui(){

//Setting Up
var _half_width = cam_width/2;
var _half_height = cam_height/2;



//Black Box
draw_set_alpha(1);
draw_sprite(spr_results_black,0,-250+display_add1,0-1440+black_add);
draw_sprite(spr_results_black,0,-250+display_add1,0+black_add);
draw_set_alpha(1);

//Black Add
if(black_add_increase == 0)
{
	black_add += 2.5;
	if(black_add > 1440)
		black_add = 0;
}



//Display Adds
display_add1 += (display_add1_to - display_add1) / 5;




}