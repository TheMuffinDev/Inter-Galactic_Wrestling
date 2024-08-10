//Interaction
if(possible_interaction)
{
	if(abs(x - obj_player.x) < 400)
	{
		can_interact = true;
		outline_width_to = 15;
	}
	else
	{
		can_interact = false;
		outline_width_to = 0;
	}
}
else
{
	can_interact = false;
	outline_width_to = 0;
}