/// @description Continuing

//Leave Results
if(room == room_results) && (can_continue)
{
	can_continue = false;
	initiate_timeline(tim_leave_results,0,1);
}

//Select an Enemy to Fight
if(menu_on == "fight board")
{
	audio_play_sound(sou_select,1,0,global.sfx_volume,0,1);
	
	menu_on = "none";
	
	//Neil
	if(selected[0] == 0) && (selected[1] == 0)
	{
		global.enemy_to_spawn = obj_neil;
		goto_room(room_arena);
	}
	
	//Chowder
	if(selected[0] == 1) && (selected[1] == 0)
	{
		global.enemy_to_spawn = obj_chowder;
		goto_room(room_arena);
	}
}