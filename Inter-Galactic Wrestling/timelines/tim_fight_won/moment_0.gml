///@desc Camera to Player
with(obj_camera)
{
	follow = obj_player;
	zoom_to = 1;
}

//Freeze Player
with(obj_player)
{
	state = STATES_PLAYER.freeze;
}

//Audio
audio_play_sound(sou_start_fight,1,0,global.sfx_volume,0,1);

//KO!!!
with(instance_create_depth(obj_player.x,y-400,depth-1,obj_damage_indicater))
{
	direction = 270;
	speed = 30;
	alarm[0] = 60;
	image_blend = make_color_hsv(0,175,255);
	text = "K.O.!!!";
	font = font_fancy;
	scale = 3.5;
	outline_width = 3.5;
	flash_speed = 5;
	instantly_destroy = true;
	alarm[1] = flash_speed;
}