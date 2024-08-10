///@desc Set Audience Rating
if(global.player_hit_counter == 0)
	audience_rating = 6;
else if(global.player_hit_counter <= 2)
	audience_rating = 5;
else if(global.player_hit_counter <= 4)
	audience_rating = 4;
else if(global.player_hit_counter <= 7)
	audience_rating = 3;
else if(global.player_hit_counter <= 12)
	audience_rating = 2;
else
	audience_rating = 1;

//Set Enemies Beaten
if(global.enemy_to_spawn == obj_neil)
	var _index = 0;
if(global.enemy_to_spawn == obj_chowder)
	var _index = 1;



if(audience_rating > global.enemies_beaten[_index])
	global.enemies_beaten[_index] = audience_rating;