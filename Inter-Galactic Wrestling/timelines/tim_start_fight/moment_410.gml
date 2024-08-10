///@desc FIGHT!!!
with(instance_create_depth(x,y-450,depth-1,obj_damage_indicater))
{
	direction = 270;
	speed = 30;
	alarm[0] = 35;
	image_blend = make_color_hsv(0,175,255);
	text = "FIGHT!";
	font = font_fancy;
	scale = 3.5;
	outline_width = 3.5;
	flash_speed = 5;
	instantly_destroy = true;
	alarm[1] = flash_speed;
}

//Camera Follows Player
with(obj_camera)
{
	follow = obj_player;
	zoom_to = 1;
	increase_time = true;
}

//Start Enemy AI
with(obj_enemy_parent)
{
	alarm[1] = 25;
}

//Release Player
with(obj_player)
{
	state = STATES_PLAYER.idle;
	frozen_in_place = false;
}

audio_play_sound(sou_start_fight,1,0,global.sfx_volume,0,1);