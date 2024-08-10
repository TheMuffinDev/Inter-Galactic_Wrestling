///@desc Opening Fight Board
can_interact = false;
possible_interaction = false;

with(obj_camera)
{
	follow = noone;
	x_to = other.x;
	y_to = other.y-1550;
	cam_speed = 5;
	menu_on = "fight board";
	display_add1 = 0;
	selected = [0,0];
}

with(obj_player)
{
	state = STATES_PLAYER.freeze;
}