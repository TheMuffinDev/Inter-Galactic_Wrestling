// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_fight_board_ui(){


//Setting Up
var _half_width = cam_width/2;
var _half_height = cam_height/2;
var _base_x = obj_board.x;
var _base_y = obj_board.y-1600;
var _selected_color = make_color_hsv(50,100,255);
var _selected_add = sine_wave(current_time / 1000, 0.75, 10, 0);
var _angle_add = sine_wave(current_time / 1000, 1, 2.5, 0);



//Buttons
set_up_text(font_base,c_white,fa_left,fa_center);



//Moving Across Menu
if(menu_on == "fight board")
{
	//Keyboard Input
	if(keyboard_check_pressed(vk_left)) && (selected[0] > 0)
	{
		selected[0]--;
		audio_play_sound(sou_move_menu,1,0,global.sfx_volume,0,1);
	}
	
	if(keyboard_check_pressed(vk_right)) && (selected[0] < 2)
	{
		selected[0]++;
		audio_play_sound(sou_move_menu,1,0,global.sfx_volume,0,1);
	}
	
	
	//Buttons
	outline_text(x-_half_width+50,y+_half_height-185,"z: Select",0.7,0.7,0,5,c_white,c_black);
	outline_text(x-_half_width+50,y+_half_height-75,"x: Back",0.7,0.7,0,5,c_white,c_black);
	
	
	//Stats
	set_up_text(font_base,c_white,fa_center,fa_center);
	if(global.enemies_beaten[selected[0]] == 0)
		outline_text(_base_x,_base_y+600,"Not Yet Beaten",1.2,1.2,_angle_add*0.5,8,make_color_hsv(0,125,255),c_black);
	else if(global.enemies_beaten[selected[0]] == 6)
		outline_text(_base_x,_base_y+600,"6/5 STARS!!!",1.2,1.2,_angle_add*0.5,8,make_color_hsv(180,100,255),c_black);
	else if(global.enemies_beaten[selected[0]] == 5)
		outline_text(_base_x,_base_y+600,"5/5 Stars!!!",1.2,1.2,_angle_add*0.5,8,make_color_hsv(180,100,255),c_black);
	else if(global.enemies_beaten[selected[0]] == 4)
		outline_text(_base_x,_base_y+600,"4/5 Stars!",1.2,1.2,_angle_add*0.5,8,make_color_hsv(180,100,255),c_black);
	else if(global.enemies_beaten[selected[0]] == 3)
		outline_text(_base_x,_base_y+600,"3/5 Stars.",1.2,1.2,_angle_add*0.5,8,make_color_hsv(180,100,255),c_black);
	else if(global.enemies_beaten[selected[0]] == 2)
		outline_text(_base_x,_base_y+600,"2/5 Stars...",1.2,1.2,_angle_add*0.5,8,make_color_hsv(180,100,255),c_black);
	else if(global.enemies_beaten[selected[0]] == 1)
		outline_text(_base_x,_base_y+600,"1/5 Stars... :(",1.2,1.2,_angle_add*0.5,8,make_color_hsv(180,100,255),c_black);
}



//Icons
set_up_text(font_base,c_white,fa_center,fa_bottom);

//Neil
if(selected[0] == 0) && (selected[1] == 0) && (menu_on == "fight board")
{
	outline_sprite(spr_fight_selection,0,_base_x-850,_base_y+_selected_add,0.9,0.9,_angle_add,_selected_color,10);
	draw_sprite_ext(spr_fight_selection,0,_base_x-850,_base_y+_selected_add,0.9,0.9,_angle_add,c_white,1);
}
else
{
	draw_sprite_ext(spr_fight_selection,0,_base_x-850,_base_y,0.8,0.8,_angle_add,c_white,1);
}

//Chowder
if(selected[0] == 1) && (selected[1] == 0) && (menu_on == "fight board")
{
	outline_sprite(spr_fight_selection,1,_base_x,_base_y+_selected_add,0.9,0.9,_angle_add,_selected_color,10);
	draw_sprite_ext(spr_fight_selection,1,_base_x,_base_y+_selected_add,0.9,0.9,_angle_add,c_white,1);
}
else
{
	draw_sprite_ext(spr_fight_selection,1,_base_x,_base_y,0.8,0.8,_angle_add,c_white,1);
}

//The Flems
if(selected[0] == 2) && (selected[1] == 0) && (menu_on == "fight board")
{
	outline_sprite(spr_fight_selection,2,_base_x+850,_base_y+_selected_add,0.9,0.9,_angle_add,_selected_color,10);
	draw_sprite_ext(spr_fight_selection,2,_base_x+850,_base_y+_selected_add,0.9,0.9,_angle_add,c_white,1);
}
else
{
	draw_sprite_ext(spr_fight_selection,2,_base_x+850,_base_y,0.8,0.8,_angle_add,c_white,1);
}


}