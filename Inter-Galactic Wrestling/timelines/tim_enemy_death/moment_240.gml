///@desc Follow Player

//Player Stuff
with(obj_player)
{
	state = STATES_PLAYER.freeze;
	walk_speed = 30;
	sprite_index = spr_player_win;
	squish(1.4,0.85);
	alarm[2] = 1;
}

//Camera Stuff
with(obj_camera)
{
	follow = obj_player;
	zoom_to = 1;
	global.enemy_target = noone;
}

//Control Stuff
with(obj_fight_control)
{
	initiate_timeline(tim_fight_won,0,1);
}

instance_destroy();