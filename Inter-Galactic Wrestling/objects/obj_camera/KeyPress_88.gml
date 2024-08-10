/// @description Exiting
if(menu_on == "fight board")
{
	menu_on = "none";
	follow = obj_player;
	cam_speed = 10;
	display_add1 = -1500;
	
	obj_player.state = STATES_PLAYER.idle;
	
	with(obj_board)
	{
		possible_interaction = true;
	}
}