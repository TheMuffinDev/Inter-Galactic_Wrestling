// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_in_game_ui(){

var _half_width = cam_width/2;
var _half_height = cam_height/2;

//Player Health Icon
draw_sprite_ext(spr_health_icon,0,x-_half_width*zoom+500*zoom,y+_half_height*zoom-150*zoom,1*zoom,1*zoom,0,c_white,1);

//Player Health Text
set_up_text(font_base,c_white,fa_left,fa_bottom);
outline_text(x-_half_width*zoom+550*zoom,y+_half_height*zoom-50*zoom,"+"+string(obj_player.hp),1.3*zoom,1.3*zoom,0,8*zoom,c_white,c_black);



//Drawing Enemy Health
if(instance_exists(global.enemy_target)) && (global.enemy_target != noone)
{
	//Enemy Health Icon
	draw_sprite_ext(spr_health_icon,global.enemy_target.health_index,x+_half_width*zoom-500*zoom,y+_half_height*zoom-150*zoom,-1*zoom,1*zoom,0,c_white,1);
	
	//Enemy Health Text
	set_up_text(font_base,c_white,fa_right,fa_bottom);
	outline_text(x+_half_width*zoom-550*zoom,y+_half_height*zoom-50*zoom,string(global.enemy_target.hp)+"+",1.3*zoom,1.3*zoom,0,8*zoom,c_white,c_black);
}



//Drawing Time
var _minutes = string(global.timing.minutes);
if(string_length(_minutes) == 1)
	_minutes = "0" + _minutes;

var _seconds = string(global.timing.seconds);
if(string_length(_seconds) == 1)
	_seconds = "0" + _seconds;
	
var _miliseconds = string(round(global.timing.miliseconds));
if(string_length(_miliseconds) == 1)
	_miliseconds = "0" + _miliseconds;

set_up_text(font_base,c_white,fa_left,fa_top);
outline_text(x-_half_width*zoom+50*zoom,y-_half_height*zoom+35*zoom,_minutes + ":" + _seconds + ":" + _miliseconds,1*zoom,1*zoom,0,6*zoom,c_white,c_black);



//Drawing Versus Icon
draw_set_alpha((1 - versus_add / 1500) * 0.9);
draw_set_color(c_black);
draw_rectangle(x-2000,y-1000,x+2000,y+1000,0);
draw_set_alpha(1);

var _player_icon_shake_x = random_range(5,-5);
var _player_icon_shake_y = random_range(5,-5);

var _enemy_icon_shake_x = random_range(5,-5);
var _enemy_icon_shake_y = random_range(5,-5);

//Lightning
set_up_text(font_fancy,c_white,fa_middle,fa_middle);
draw_sprite_ext(spr_versus_lightning,0,x,y-versus_add,1.2,1.2,0,c_white,1);
outline_text(x,y-450-versus_add*0.5,"ROUND 1",3,3,0,12,make_color_hsv(0,175,255),c_black);

//Player
set_up_text(font_base,c_white,fa_left,fa_middle);
draw_sprite_ext(spr_versus_icon,0,x-60-versus_add+_player_icon_shake_x,y-10+_player_icon_shake_y,1.2,1.2,0,c_white,1);

//Enemy
set_up_text(font_base,c_white,fa_right,fa_middle);

if(instance_exists(global.enemy_target)) && (global.enemy_target != noone)
	draw_sprite_ext(spr_versus_icon,global.enemy_target.versus_index,x+60+versus_add+_enemy_icon_shake_x,y-10+_enemy_icon_shake_y,1.2,1.2,0,c_white,1);

}