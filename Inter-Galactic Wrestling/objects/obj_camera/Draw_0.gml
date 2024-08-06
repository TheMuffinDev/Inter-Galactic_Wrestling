//Setting Up
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
var _minutes = string(timing.minutes);
if(string_length(_minutes) == 1)
	_minutes = "0" + _minutes;

var _seconds = string(timing.seconds);
if(string_length(_seconds) == 1)
	_seconds = "0" + _seconds;
	
var _miliseconds = string(round(timing.miliseconds));
if(string_length(_miliseconds) == 1)
	_miliseconds = "0" + _miliseconds;

set_up_text(font_base,c_white,fa_left,fa_top);
outline_text(x-_half_width*zoom+50*zoom,y-_half_height*zoom+35*zoom,_minutes + ":" + _seconds + ":" + _miliseconds,1*zoom,1*zoom,0,6*zoom,c_white,c_black);



//Drawing Versus Icon
draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(x-2000,y-1000,x+2000,y+1000,0);
draw_set_alpha(1);
set_up_text(font_fancy,c_white,fa_center,fa_center);

var _player_icon_shake_x = random_range(5,-5);
var _player_icon_shake_y = random_range(5,-5);

var _enemy_icon_shake_x = random_range(5,-5);
var _enemy_icon_shake_y = random_range(5,-5);

//Lightning
draw_sprite_ext(spr_versus_icon,0,x,y-versus_add,1.2,1.2,0,c_white,1);

//Player
draw_sprite_ext(spr_versus_icon,1,x-60-versus_add+_player_icon_shake_x,y-10+_player_icon_shake_y,1.2,1.2,0,c_white,1);
outline_text(x-300,y-200,global.player_name,4,4,-8,4,c_white,c_black);

//Enemy
draw_sprite_ext(spr_versus_icon,global.enemy_target.versus_index,x+60+versus_add+_enemy_icon_shake_x,y-10+_enemy_icon_shake_y,1.2,1.2,0,c_white,1);
outline_text(x+300,y-200,global.enemy_target.enemy_name,4,4,-8,4,c_white,c_black);




//Moving the Camera
if(follow != noone)
{
	x_to = follow.x;
	if(follow = obj_player)
		y_to = obj_fight_control.y;
}

x += (x_to - x) / cam_speed;
y += (y_to - y) / cam_speed;


//Zoom
zoom += (zoom_to - zoom) / zoom_speed;